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
        NavigationStack {
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
                    NavigationLink(destination: InputPage(), label: {
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
                        guard let encodedData = UserDefaults.standard.data(forKey: "Players")
                        else {
                            return
                        }
                        let object = try? JSONDecoder().decode([User].self, from: encodedData)
                        if (object == nil) {
                            return
                        }
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
