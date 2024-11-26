//
//  SettingsView.swift
//  Framed
//
//  Created by Ali on 27/11/2024.
//

import SwiftUI

struct SettingsView : View {
    var body : some View {
        TabView {
            Tab("General", systemImage: "gear") {
                VStack {
                    Text("General Settings view to come here")
                }
                .padding(.top,20)
            }
            Tab("Advanced", systemImage: "tray.and.arrow.down.fill") {
                VStack {
                    Text("Advanced Settings View to come here")
                }
                .padding(.top,20)

            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black.opacity(0.231))
    }
}


#Preview {
    SettingsView()
}

