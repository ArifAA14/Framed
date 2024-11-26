//
//  ProgressBarView.swift
//  Framed
//
//  Created by Ali on 26/11/2024.
//

import SwiftUI

struct ProgressBarView: View {
    @State private var progress: Double = 0
    var duration: TimeInterval
    
    var body: some View {
        ProgressView(value: progress, total: 1.0)
            .progressViewStyle(LinearProgressViewStyle(tint: .blue))
            .onAppear {
                startProgressTimer()
            }
            .frame(height: 6)
            .frame(maxWidth: 100)
    }
    
    private func startProgressTimer() {
        let interval = 0.05
        let totalSteps = duration / interval
        var currentStep = 0.0
        
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
            currentStep += 1
            progress = currentStep / totalSteps
            
            if currentStep >= totalSteps {
                timer.invalidate() 
            }
        }
    }
}
