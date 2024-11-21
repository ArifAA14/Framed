//
//  Head.swift
//  MyFirst
//
//  Created by Ali on 20/11/2024.
//


import SwiftUI

struct Head: View {
    var body: some View {
        HStack {
            Text("Library")
                .font(.largeTitle)
                .fontDesign(.default)
                .foregroundColor(.white.opacity(1))
                .fontWeight(.light)
            Spacer()
            CustomButton(label: "New",
                         icon: "record.circle",
                         action: handleNewCapture)
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func handleNewCapture (){
        print("Capture button tapped!")
        if let mainWindow = NSApplication.shared.windows.first {
            if mainWindow.isVisible {
                mainWindow.orderOut(nil) // Hide the main window
            }
        }
        _ = showOverlay()
    }
}
