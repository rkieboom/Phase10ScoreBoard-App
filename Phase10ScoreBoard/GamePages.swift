//
//  GamePages.swift
//  Phase10ScoreBoard
//
//  Created by Rowan van den Kieboom on 07/12/2022.
//bh 

import SwiftUI
import Combine

struct ScoreBoard: View {
    @Binding var myUsers: [User]
    @State var refresh = false
    
    init(myUsers: Binding<[User]>) {
        self._myUsers = myUsers
        self.refresh.toggle()
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .blue, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top)
            VStack {
                Text("Scoreboard")
                    .font(.system(size: 50))
                    .bold()
                    .padding(.bottom, 50)
                
                HStack {
                    Text("Names")
                        .padding(.leading)
                    Spacer()
                    Text("Phase")
                        .padding(.trailing)
                    
                    Text("Score")
                        .padding(.trailing)
                }
                ForEach(self.myUsers.indices, id: \.self) { i in
                    HStack {
                        Text("\(self.myUsers[i].name)")
                            .font(.system(size: 40))
                            .padding()
                            .border(.red)
                            
                        Spacer()
                        Text("\(self.myUsers[i].getPhase()) -    \(self.myUsers[i].getScore())")
                            .font(.system(size: 40))
                            .padding()
                            .border(.red)
                          
                    }
                }
                Spacer()
            }.padding(.top, 25)
        }
    }
}

struct AddScore: View {
    @Binding var myUsers: [User]
    @State var addScore: [String] = ["", "", "", "", "", ""]
    @FocusState var isFocused: Bool
    
    func checkInput() -> Int {
        var emptyScores: Int = 0

        for i in 0..<myUsers.count {
            if (self.addScore[i] == "" || self.addScore[i] == "0") {
                emptyScores += 1
            }
            else {
                if (((addScore[i] as NSString).integerValue % 5) != 0) {
                    return 2
                }
            }
        }
        if (emptyScores > 1) {
            return 1
        }
        
        return 0
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .blue, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top)
            VStack {
                ForEach(self.myUsers.indices, id: \.self) { i in
                    HStack {
                        Text("\(self.myUsers[i].name)")
                            .font(.title)
                            .bold()
                            .padding(.leading, 10)
                        Spacer()
                    }
                            

                    
                        TextField("Enter score...", text: $addScore[i])
                        .focused($isFocused)
                        .padding(.leading, 10)
                        .padding(.bottom, 25)
                            .keyboardType(.numberPad)
                            .onReceive(Just(addScore[i])) { newValue in
                                            let filtered = newValue.filter { "0123456789".contains($0) }
                                            if filtered != newValue {
                                                self.addScore[i] = filtered
                                            }
                                        }
                }
                
                Spacer()
                Button(action: {
                let ret = checkInput()
                print(ret)
                if (ret == 0) {
                    for i in 0..<self.myUsers.count {
                        myUsers[i].addScore(N: (addScore[i] as NSString).integerValue)
//                        print("\(i). Score=\((addScore[i] as NSString).integerValue)")
                        addScore[i] = ""
//                        print(self.myUsers[i].getScore())
                    }
                    self.isFocused = false
                }
//                    hiddenTrigger.toggle()
                    self.myUsers = myUsers.map { $0 }
                    saveData()
                }, label: {
                    Text("Update")
                        .frame(width: 120, height: 50)
                        .background(Color.gray)
                        .foregroundColor(.black)
                        .cornerRadius(15.0)
                        .shadow(radius: 15)
                })
                .padding(.bottom, 15)
            }
        }
    }
    
    func saveData() {
        let encoded = try? JSONEncoder().encode(self.myUsers)
        UserDefaults().set(encoded, forKey: "Players")
    }
}
struct EditScore: View {
    @Binding var myUsers: [User]
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.red, .blue, .white]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.top)
            Text("Hello editScore")
            VStack {
                ForEach(self.myUsers.indices, id: \.self) { i in
                    Text("\(self.myUsers[i].name) - \(self.myUsers[i].getScore())")
                        .font(.title)
                        .bold()
                        .padding(.leading, 10)
                    Spacer()
                }
            }
        }
    }
}

struct GamePages: View {
//    var myUsers: [User]
    @Binding var myUsers: [User]
    @State private var selected: Int = 0
    
    var body: some View {
        ZStack {
            TabView(selection: $selected) {
                ScoreBoard(myUsers: $myUsers).tabItem { Text("Scoreboard") }.tag(0)
                AddScore(myUsers: $myUsers).tabItem { Image(systemName: "plus.circle") }.tag(1)
                EditScore(myUsers: $myUsers).tabItem { Text("Edit") }.tag(2)
            }
            .toolbarBackground(Color.red, for: .tabBar).ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct GamePages_Previews: PreviewProvider {
    @State var myUsers: [User]
    init() {
        self.myUsers = [User(name: "Rowan"), User(name: "Renee")]
    }
    static var previews: some View {
        GamePages(myUsers: self.init().$myUsers)
    }
}
