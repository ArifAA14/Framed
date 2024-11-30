//
//  PopoverContent.swift
//  Framed
//
//  Created by Ali on 24/11/2024.
//

import SwiftUI

struct PopoverContent: View {
    var openConfigWindow: () -> Void
    var body: some View {
        VStack(spacing: 0) {
            Button (action: handleNewCapture) {
                VStack {
                    Image(systemName: "rectangle.dashed.badge.record")
                        .font(.system(size: 30))
                        .foregroundColor(.white.opacity(1))
                        .padding(.top, 26)
                    Text("New Recording")
                        .font(.title3)
                        .bold()
                        .padding(.top, 4)
                        .padding(.bottom,0.02)
                        .foregroundColor(.white.opacity(1))
                    Text("⌘ G")
                        .font(.system(size: 12))
                        .fontWeight(.light)
                        .padding(.top, 0)
                        .padding(.bottom, 20)
                        .foregroundColor(.gray.opacity(0.887))
                    
                }
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            .keyboardShortcut("G")
            .frame(minHeight: 100)
            Divider()
            Button(action: openConfigWindow) {
                HStack(spacing: 6) {
                    Text("Settings")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.664))
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
            Divider()
            Button(action: {
                NSApplication.shared.terminate(nil)
            }) {
                HStack(spacing: 6) {
                    Text("Quit")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.664))
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
        }
        .background(.ultraThinMaterial.opacity(0.123))
        .padding(0)
        .padding(.bottom, 0)
    }
    
    
    func handleNewCapture (){
        print("Capture button tapped!")
        _ = showOverlay()
    }
}

