//
//  GenralSettingsView.swift
//  Framed
//
//  Created by Ali on 01/12/2024.
//


import SwiftUI

struct GeneralSettingsView : View {
    @State private var selectedDuration : Int = 5;
    @State var openFile = false

    private let durations = [5, 6, 7, 8, 9 , 10]
    
    var body : some View {
        VStack {
            
            HStack (alignment: .top, spacing: 20){
                Text("Duration")
                    .foregroundColor(.white.opacity(0.797))
                    .frame(alignment: .top)
                    .font(.system(size: 12, weight: .medium))
//                Picker("", selection: $selectedDuration) {
//                    ForEach(durations, id: \.self) { duration  in
//                        Text(String(duration))
//                        
//                    }
//                }
//                .frame(maxWidth: 200)
//                .pickerStyle(.palette)
//                .paletteSelectionEffect(.automatic)
                
                DurationPicker(selectedDuration: $selectedDuration)
            }
            .padding(.top, 0)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, alignment: .top)
            
            Divider()
                .padding(.top, 20)
           Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(10)
        .padding(.top, 20)
    }
}

#Preview {
    GeneralSettingsView()
}
