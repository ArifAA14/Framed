//
//  OverlayHelpers.swift
//  MyFirst
//
//  Created by Ali on 21/11/2024.
//

import Cocoa

func showOverlay() -> OverlayWindow {
    let overlayWindow = OverlayWindow()
    
    overlayWindow.makeKeyAndOrderFront(nil)
    
    // Bring the OverlayWindow to the front and ensure it captures input
    NSApp.activate(ignoringOtherApps: true)
    
    
    return overlayWindow
}
