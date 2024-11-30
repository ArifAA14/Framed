//
//  SettingsView.swift
//  Framed
//
//  Created by Ali on 27/11/2024.
//

import SwiftUI

struct SettingsView : View {
    var body : some View {
        GeneralSettingsView()
        .padding(.top, 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black.opacity(0.231))
        .ignoresSafeArea()
    }
}


#Preview {
    SettingsView()
}

