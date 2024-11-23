//
//  OverlayHelpers.swift
//  MyFirst
//
//  Created by Ali on 21/11/2024.
//

import Cocoa
import ScreenCaptureKit


func showOverlay() -> OverlayWindow {
    let overlayWindow = OverlayWindow()
    
    overlayWindow.makeKeyAndOrderFront(nil)
    
    // Bring the OverlayWindow to the front and ensure it captures input
    NSApp.activate(ignoringOtherApps: true)
    
    
    return overlayWindow
}


 func applyDimmingEffect(to contentView: NSView?, selectedRect: CGRect) -> CAShapeLayer {
    let dimmingLayer = CAShapeLayer()
    dimmingLayer.frame = contentView?.bounds ?? .zero
    dimmingLayer.fillColor = NSColor.black.withAlphaComponent(0.6).cgColor
    
    let path = CGMutablePath()
    path.addRect(dimmingLayer.bounds)
    path.addRect(selectedRect)
    
    dimmingLayer.path = path
    dimmingLayer.fillRule = .evenOdd
    
    contentView?.layer = CALayer()
    contentView?.layer?.addSublayer(dimmingLayer)
    
    return dimmingLayer
}

 func removeDimmingEffect(from dimmingLayer: CAShapeLayer?) {
    dimmingLayer?.removeFromSuperlayer()
}

 func adjustedRect(for rect: CGRect, onScreen screenHeight: CGFloat, scale: CGFloat) -> CGRect {
    return CGRect(
        x: rect.origin.x * scale,
        y: (screenHeight - rect.origin.y - rect.height) * scale,
        width: rect.width * scale,
        height: rect.height * scale
    )
}

 func configureSavePanel(defaultDirectory: URL, fileName: String) -> NSSavePanel {
    let savePanel = NSSavePanel()
    savePanel.title = "Save Recording"
    savePanel.allowedContentTypes = [UTType.movie]
    savePanel.nameFieldStringValue = fileName
    savePanel.canCreateDirectories = true
    savePanel.directoryURL = defaultDirectory
    return savePanel
}

 func ensureDirectoryExists(at url: URL) {
    if !FileManager.default.fileExists(atPath: url.path) {
        do {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
            print("Directory created at: \(url.path)")
        } catch {
            print("Failed to create directory: \(error)")
        }
    }
}



