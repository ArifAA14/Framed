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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .padding(10)
    }
}


#Preview {
    SettingsView()
}

