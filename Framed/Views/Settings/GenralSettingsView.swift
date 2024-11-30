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
            
            HStack{
                Text("Duration (s)")
                    .foregroundColor(.white.opacity(0.777))
                Spacer()
                Picker("", selection: $selectedDuration) {
                    ForEach(durations, id: \.self) { duration  in
                        Text(String(duration))
                        
                    }
                }
                .frame(maxWidth: 200)
                .pickerStyle(.palette)
                .paletteSelectionEffect(.automatic)
            }
            .padding(.top, 10)
            .padding(.horizontal, 20)
            Divider()
                .padding(.top, 10)
            
            
            HStack{
                Text("Export Location")
                    .foregroundColor(.white.opacity(0.777))
                Spacer()
                Button {
                    self.openFile.toggle()
                } label: {
                    HStack{
                        Text("Select")
                            .font(.system(size: 14))
                            .foregroundColor(.blue)
                    
                    }
                }
                .buttonStyle(.plain)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .fileImporter(isPresented: $openFile, allowedContentTypes: [.mp3, .quickTimeMovie], onCompletion: {result in })
            }
            .padding(.top, 10)
            .padding(.horizontal, 20)
            Divider()
                .padding(.top, 10)
            
            
            HStack{
                Text("Duration")
                    .foregroundColor(.white.opacity(0.777))
                Spacer()
                Picker("", selection: $selectedDuration) {
                    ForEach(durations, id: \.self) { duration  in
                        Text(String(duration))
                        
                    }
                }
                .frame(maxWidth: 150)
            }
            .padding(.top, 10)
            .padding(.horizontal, 20)
            Divider()
                .padding(.top, 10)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(0)
        
        .padding(.top, 20)
        Spacer()
    }
}
