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
    @State var offset: CGFloat = -UIScreen.main.bounds.height
    
    var body: some View {
        
        ZStack {
            // View
            Button(action: {
                self.offset = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.open.toggle()
                }
            }, label: {
                Text("Open")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .foregroundStyle(Color(.label))
            })
            
            ZStack {
                Color.red.opacity(0.6)
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.open.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.offset = -UIScreen.main.bounds.height
                            }
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
            .offset(y: self.offset)
            .rotation3DEffect(.init(degrees: self.open ? 0 : 55),
                              axis: (x: self.open ? 0 : 1.0, y: 0.0, z: 0.0))
            .opacity(self.offset == -UIScreen.main.bounds.height ? 0 : 1.0)
        }
        .animation(.spring(duration: 0.5))
    }
}

#Preview {
    ContentView()
}
