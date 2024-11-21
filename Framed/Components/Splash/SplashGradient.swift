//
//  SplashGradient.swift
//  MyFirst
//
//  Created by Ali on 19/11/2024.
//

import SwiftUI

struct SplashGradient: View {
    @State var t: Float = 0.0
    @State var timer: Timer?
    
    var body: some View {
        MeshGradient(width: 3, height: 3, points: [
            .init(0, 0), .init(0.5, 0), .init(1, 0),
            
            [sinInRange(-0.8...(-0.2), offset: 0.439, timeScale: 0.342, t: t), sinInRange(0.3...0.7, offset: 3.42, timeScale: 0.1084, t: t)],
            [sinInRange(0.1...0.8, offset: 0.239, timeScale: 0.084, t: t), sinInRange(0.2...0.8, offset: 5.21, timeScale: 0.242, t: t)],
            [sinInRange(1.0...1.5, offset: 0.939, timeScale: 0.084, t: t), sinInRange(0.4...0.8, offset: 0.25, timeScale: 0.642, t: t)],
            [sinInRange(-0.8...0.0, offset: 1.439, timeScale: 0.442, t: t), sinInRange(1.4...1.9, offset: 3.42, timeScale: 0.984, t: t)],
            [sinInRange(0.3...0.6, offset: 0.339, timeScale: 0.784, t: t), sinInRange(1.0...1.2, offset: 1.22, timeScale: 0.772, t: t)],
            [sinInRange(1.0...1.5, offset: 0.939, timeScale: 0.056, t: t), sinInRange(1.3...1.7, offset: 0.47, timeScale: 0.342, t: t)]
        ], colors: [
            .black.opacity(1), .orange.opacity(0.9), .white.opacity(0.6),
            .yellow.opacity(0.4), .black.opacity(0.88), .black.opacity(0.88),
            .pink, .red, .red.opacity(0.66)
        ])
        .onAppear {
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                t += 0.02
            }
        }
        .blur(radius: 150)
        .ignoresSafeArea()
        .background(.black.opacity(0.33))
        
    }
    
    func sinInRange(_ range: ClosedRange<Float>, offset: Float, timeScale: Float, t: Float) -> Float {
        let amplitude = (range.upperBound - range.lowerBound) / 0.995
        let midPoint = (range.upperBound + range.lowerBound) / 2.09
        return midPoint + amplitude * sin(timeScale * t + offset)
    }
}


#Preview {
    SplashGradient()
}

