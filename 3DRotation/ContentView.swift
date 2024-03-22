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
            Image("aw")
                .resizable()
                //.scaledToFit()
                .ignoresSafeArea()
            
            Button(action: {
                self.offset = 0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.open.toggle()
                }
            }, label: {
                Text("Open")
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .foregroundStyle(.white)
                    
            })
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            
            ZStack {
                Color.white.opacity(0.6)
            
                VStack {
                    HStack {
                        Text("Angkor Wat is a Hindu-Buddhist temple complex in Cambodia, located on a site measuring 162.6 hectares. It resides within the ancient Khmer capital city of Angkor. The Guinness World Records considers it as the largest religious structure in the world.")
                            .font(.system(size: 17, weight: .bold, design: .monospaced))

                       //Spacer()
                        
                        Button(action: {
                            self.open.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.offset = -UIScreen.main.bounds.height
                            }
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title2)
                                .foregroundStyle(.gray)
                        })
                        .offset(y: -100)
                    }
                    .padding()
                    
                    Spacer()
                    
                }
            }
            .cornerRadius(25)
            .padding(35)
            .offset(y: self.offset)
            .rotation3DEffect(.init(degrees: self.open ? 0 : 55),
                              axis: (x: self.open ? 0 : 1.0, y: 0.0, z: 0.0))
            .opacity(self.offset == -UIScreen.main.bounds.height ? 0 : 1.0)
        }
        .animation(.easeOut(duration: 0.5))
    }
}

#Preview {
    ContentView()
}
