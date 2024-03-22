//  /*
//
//  Project: RotationApp
//  File: ContentView.swift
//  Created by: Elaidzha Shchukin
//  Date: 22.03.2024
//
//  */

import SwiftUI

struct ContentView: View {
    @State var open = false
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        ZStack {
           // View
            Button(action: {
                
            }, label: {
                Text("Open")
            })
            
            ZStack {
                Color.red.opacity(0.6)
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                                .foregroundStyle(.white)
                        })
                        .padding()
                    }
                    
                    Spacer()
                }
            }
            .cornerRadius(25)
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
