//
//  ContentView.swift
//  Phase10ScoreBoard
//
//  Created by Rowan van den Kieboom on 13/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isStarted: Bool = false;
    @State var dataExists: Bool = false
    @State var object: [User] = []
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
                    NavigationLink(destination: GamePages(myUsers: self.$object), label: {
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
                        .disabled(dataExists == false)
                    Spacer()
                    Spacer()
                }
            }
        }
        .onAppear {
            loadGame()
        }
    }
    func loadGame() {
        guard let encodedData = UserDefaults.standard.data(forKey: "Players") else {
            return
        }
        let tempObject: [User]? = try? JSONDecoder().decode([User].self, from: encodedData)
        if (tempObject != nil) {
            dataExists = true
            self.object = (tempObject! as [User])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
