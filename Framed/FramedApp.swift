//
//  FramedApp.swift
//  Framed
//
//  Created by Ali on 21/11/2024.
//

import SwiftUI

@main
struct FramedApp: App {
    @Environment(\.openWindow) var openWindow

    var body: some Scene {
        MenuBarExtra("Framed", systemImage: "rectangle.dashed.badge.record") {
            PopoverContent(openConfigWindow: openConfigWindow)

        }
        .menuBarExtraStyle(.window)
        
        Window("Preferences", id: "settings") {
            SettingsView()
                .background(VisualEffectBlur())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .frame(minWidth: 450, minHeight: 400)
                .ignoresSafeArea()
        }
        .windowStyle(.hiddenTitleBar)
       
    }
    
    
    func openConfigWindow() {
        NSApplication.shared.activate(ignoringOtherApps: true)
        openWindow(id: "settings")
    }
}

struct VisualEffectBlur: NSViewRepresentable {
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = .fullScreenUI
        view.blendingMode = .behindWindow
        view.state = .active
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {}
}

