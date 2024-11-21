//
//  SplashText.swift
//  MyFirst
//
//  Created by Ali on 20/11/2024.
//

import SwiftUI

struct SplashText: View {
    @State private var showFirstText: Bool = true // Control which text is shown
    @State private var showSecondText: Bool = false;
    @State private var fadeAnimation: Bool = true // Control animation transitions
    
    
    var body: some View {
        VStack {
            if showFirstText {
                Text("Framed* ")
                    .font(.system(size: 100, weight: .light, design: .serif ))
                    .foregroundColor(.white.opacity(0.4))
                    .shadow(radius: 10)
                    .blendMode(.overlay)
                    .transition(.opacity)
                    .opacity(fadeAnimation ? 1 : 0)
                    
                   
            } else if showSecondText {
                Text("Capturing your screens")
                    .font(.system(size: 100, weight: .light, design: .serif))
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .blendMode(.overlay)
                    .transition(.opacity)
                    .opacity(fadeAnimation ? 1 : 0)
            } else {
                Text("Your way")
                    .font(.system(size: 100, weight: .light, design: .serif))
                    .foregroundColor(.white)
                    .shadow(radius: 10)
                    .blendMode(.overlay)
                    .transition(.opacity)
                    .opacity(fadeAnimation ? 1 : 0)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.88) {
                withAnimation(.easeInOut(duration: 1)) {
                    fadeAnimation = false;
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation(.easeInOut(duration: 1)) {
                        showSecondText = true
                        showFirstText = false
                        fadeAnimation = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                        withAnimation(.easeInOut(duration: 1)) {
                            fadeAnimation = false
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                            withAnimation(.easeInOut(duration: 1)) {
                                showSecondText = false
                                fadeAnimation = true
                            }
                        }
                    }
                }
            }
        }

    }
}

