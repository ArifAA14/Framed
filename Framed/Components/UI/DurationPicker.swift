//
//  DurationPicker.swift
//  Framed
//
//  Created by Ali on 03/12/2024.
//

import SwiftUI


struct DurationPicker : View {
    @Binding var selectedDuration: Int


    var body : some View {
        HStack (spacing : 30){
            Button(action: {selectedDuration = 5}) {
                VStack (spacing: 14) {
                    Image(systemName: "05.circle")
                        .font(.system(size: 24))
                    Text("5 seconds")
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(selectedDuration == 5 ? Color.gray.opacity(0.48) : Color.clear)
                        .cornerRadius(10)
                    
                }
            }
            .buttonStyle(.plain)
        
            
      
                Button(action: {selectedDuration = 8}) {
                    VStack (spacing: 10) {
                        Image(systemName: "08.circle")
                            .font(.system(size: 24))
                        Text("8 seconds")
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(selectedDuration == 8 ? Color.gray.opacity(0.48)  : Color.clear)
                            .cornerRadius(10)
                        
                    }
                }
                .buttonStyle(.plain)
            
            
            Button(action: {selectedDuration = 10}) {
                VStack (spacing: 10) {
                    Image(systemName: "10.circle")
                        .font(.system(size: 24))
                    Text("10 seconds")
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(selectedDuration == 10 ? Color.gray.opacity(0.48) : Color.clear)
                        .cornerRadius(10)
                    
                }
            }
            .buttonStyle(.plain)
 
            
            Button(action: {selectedDuration = 12}) {
                VStack (spacing: 10) {
                    Image(systemName: "12.circle")
                        .font(.system(size: 24))
                    Text("12 seconds")
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background( selectedDuration == 12 ? Color.gray.opacity(0.48) : Color.clear)
                        .cornerRadius(10)
                    
                }
            }
            .buttonStyle(.plain)
        }
        .frame(maxWidth: .infinity, alignment: .center)

        
    }

}
