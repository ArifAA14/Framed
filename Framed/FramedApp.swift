//
//  FramedApp.swift
//  Framed
//
//  Created by Ali on 21/11/2024.
//

import SwiftUI

@main
struct FramedApp: App {
    
    var body: some Scene {
        MenuBarExtra("Framed", systemImage: "rectangle.dashed.badge.record") {
                PopoverContent()
        }
        .menuBarExtraStyle(.window)
    }
}

