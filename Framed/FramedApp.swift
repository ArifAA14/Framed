//
//  FramedApp.swift
//  Framed
//
//  Created by Ali on 21/11/2024.
//

import SwiftUI

@main
struct FramedApp: App {
    @State private var showSplashScreen: Bool = false
    var body: some Scene {
        WindowGroup {
            if showSplashScreen {
                SplashView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(VisualEffectBlur())
            } else {
                MainView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(minWidth: 600, minHeight: 500)
                    .background(VisualEffectBlur())
            }
        }
        
        .windowStyle(.hiddenTitleBar)
        .commands {
            CommandGroup(replacing: .newItem) {}
        }
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
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
    }
}

