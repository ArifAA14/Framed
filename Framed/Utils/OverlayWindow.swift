//
//  OverlayWindow.swift
//  Framed
//
//  Created by Ali on 21/11/2024.
//

import Cocoa
import ScreenCaptureKit

class OverlayWindow: NSWindow, SelectionToolDelegate, SCRecordingOutputDelegate {
    private var activeStream: SCStream?
    private var outputURL: URL = {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent("capture.mov")
    }()
    
    private var dimmingLayer: CAShapeLayer?
    
    override var canBecomeKey: Bool { true }
    
    init() {
        let screenFrame = NSScreen.main?.frame ?? .zero
        super.init(
            contentRect: screenFrame,
            styleMask: [.borderless],
            backing: .buffered,
            defer: false
        )
        
        self.backgroundColor = NSColor.clear
        self.isOpaque = false
        self.level = .screenSaver
        self.ignoresMouseEvents = false
        self.collectionBehavior = [.canJoinAllSpaces, .fullScreenAuxiliary]
        
        let selectionTool = SelectionTool(frame: screenFrame)
        selectionTool.delegate = self
        self.contentView = selectionTool
    }
    
    override func keyDown(with event: NSEvent) {
        if event.keyCode == 53 {
            print("Escape key pressed")
            closeOverlay()
        }
    }
    
    func closeOverlay() {
        self.orderOut(nil) // Close the overlay
        NSApplication.shared.activate(ignoringOtherApps: true) // Refocus on the menu bar app
    }
    

    
    func didSelect(rect: CGRect) async {
        print("Starting Process with rectangle: \(rect)")
        dimmingLayer = applyDimmingEffect(to: contentView, selectedRect: rect)
        do {
            let content = try await SCShareableContent.excludingDesktopWindows(false, onScreenWindowsOnly: true)
            guard let mainDisplay = content.displays.first else {
                return
            }
            
            let overlayWindow = content.windows.first { $0.windowID == UInt32(self.windowNumber) }
            
            if let overlayWindow = overlayWindow {
                print("Excluding OverlayWindow: \(overlayWindow)")
            }
            
            let excludedWindows = overlayWindow != nil ? [overlayWindow!] : []
            
            let scale = NSScreen.main?.backingScaleFactor ?? 1.0
            let screenHeight = mainDisplay.frame.height
            
            // Adjust for screen scaling and coordinate system
            let adjustedRect = adjustedRect(for: rect, onScreen: screenHeight, scale: scale)

            
            let streamConfig = SCStreamConfiguration()
            streamConfig.sourceRect = adjustedRect
            streamConfig.width = Int(adjustedRect.width)
            streamConfig.height = Int(adjustedRect.height)
            streamConfig.scalesToFit = true
            streamConfig.preservesAspectRatio = true
            streamConfig.pixelFormat = kCVPixelFormatType_420YpCbCr10BiPlanarVideoRange
            print("Final Stream Configuration: \(streamConfig.sourceRect)")
            
            // Content filter, excluding the OverlayWindow
            let contentFilter = SCContentFilter(display: mainDisplay, excludingWindows: excludedWindows)
            let stream = SCStream(filter: contentFilter, configuration: streamConfig, delegate: nil)
            self.activeStream = stream
            
            // Recording Output
            let recordingConfiguration = SCRecordingOutputConfiguration()
            recordingConfiguration.outputURL = outputURL
            recordingConfiguration.outputFileType = .mp4
            recordingConfiguration.videoCodecType = .hevc
            
            let recordingOutput = SCRecordingOutput(configuration: recordingConfiguration, delegate: self)
            try stream.addRecordingOutput(recordingOutput)
            try await stream.startCapture()
            print("Recording started successfully.")
            
            // Limit recordings to 5s, later let users decide, limit to 10??
            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { [weak self] _ in
                Task {
                    await self?.stopStream()
                }
            }
        } catch {
            print("Error setting up recording: \(error)")
        }
    }



    @MainActor
    func stopStream() async {
        do {
            try await activeStream?.stopCapture()
            print("Recording stopped successfully. File saved at: \(outputURL)")
            removeDimmingEffect(from: dimmingLayer)
            closeOverlay()
            
            let desktopDirectory = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first!
            let framedLibraryFolder = desktopDirectory.appendingPathComponent("Framed Library")
            ensureDirectoryExists(at: framedLibraryFolder)
            
            let savePanel = configureSavePanel(defaultDirectory: framedLibraryFolder, fileName: "framed_capture.mov")
            if savePanel.runModal() == .OK, let selectedURL = savePanel.url {
                print("User selected save location: \(selectedURL)")
                try FileManager.default.moveItem(at: outputURL, to: selectedURL)
                print("File successfully moved to: \(selectedURL)")
            } else {
                print("User canceled save panel or no URL selected.")
            }
        } catch {
            print("Error stopping recording: \(error)")
        }
    }

}

