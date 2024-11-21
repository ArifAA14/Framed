//
//  CustomButton.swift
//  MyFirst
//
//  Created by Ali on 20/11/2024.
//

import SwiftUI

struct CustomButton: View {
    let label: String 
    let icon: String?
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                if let icon = icon {
                    Image(systemName: icon)
                }
                Text(label)
            }
            .padding(6.5)
            .foregroundColor(.white)
        }
        .buttonStyle(.plain)
        .padding(.vertical, 2.5)
        .padding(.horizontal, 5)
        .background(
            .ultraThinMaterial.opacity(0.5),
            in: RoundedRectangle(
                cornerRadius: 6,
                style: .circular
            )
        )
        .overlay(
            RoundedRectangle(cornerRadius: 6, style: .circular)
                .stroke(Color.white.opacity(0.189), lineWidth: 0.426)
        )
    }
}
