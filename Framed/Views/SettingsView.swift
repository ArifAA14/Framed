//
//  SettingsView.swift
//  Framed
//
//  Created by Ali on 27/11/2024.
//

import SwiftUI

struct SettingsView : View {
    var body : some View {
        VStack {
            Text("Settings")
                .font(.title)
                .padding(.bottom, 20)
            
            Text("Adjust your preferences here.")
                .font(.body)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black.opacity(0.213))
        .ignoresSafeArea()
    }
}
