//
//  ContentView.swift
//  Phase10ScoreBoard
//
//  Created by Rowan van den Kieboom on 13/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isStarted = false;
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .blue, .green, .yellow]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Image("masters-removebg-preview")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(.red)
                    .shadow(radius: 10)
                Spacer()
                Button(action: {
                }, label: {
                    Text("New game")
                        .padding()
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .background(Color.white)
                        .cornerRadius(15.0)
                        .shadow(radius: 10)
                        .foregroundColor(Color.red)
                        .font(.custom("AmericanTypewriter", size: 45))
                })
                Button(action: {
                }, label: {
                    Text("Load game")
                        .padding()
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                        .background(Color.white)
                        .cornerRadius(15.0)
                        .shadow(radius: 10)
                        .foregroundColor(Color.red)
                        .font(.custom("AmericanTypewriter", size: 45))
                })
                Spacer()
                Spacer()
                
//                    Button(action: {
//                        isStarted = true;
//                    }, label: {Text("Start").font(.system(size: 36))})
//                    .foregroundColor(.white)
//                    .fontWeight(.bold)
            }
        }
    }
    func startNewGame() {
        
    }
    
    func loadGame() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
