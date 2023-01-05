//
//  InputPage.swift
//  Phase10ScoreBoard
//
//  Created by Rowan van den Kieboom on 06/12/2022.
//

import SwiftUI


struct InputPage: View {
    @State private var start: Bool = false;
    @State private var selected: Int = 2;
    @State public var names: [String] = ["", "", "", "", "", ""];
    @State var show: Bool = false
    @State var myUsers: [User] = []
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.red, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                
                VStack {
                    Image("masters-removebg-preview")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    Text("Choose amount of players:")
                        .font(.system(size: 30))
                        .bold()
                        .foregroundColor(.white)
                    Picker(selection: $selected, label: Text("Picker")) {
                        Text("2").tag(2)
                        Text("3").tag(3)
                        Text("4").tag(4)
                        Text("5").tag(5)
                        Text("6").tag(6)
                    }
                    .accentColor(.white)
                    .padding(.bottom, 30.0)
                    
                    //Creating user input forms!
                    ForEach(0..<selected, id: \.self) { index in
                        TextField("\(index + 1). Enter name", text: $names[index])
                            .textFieldStyle(.roundedBorder)
                            .autocorrectionDisabled()
                    }
                    Spacer()
                    Button(action: {
                        for index in 0..<selected {
                            let newUser = User(name: self.names[index])
                            myUsers.append(newUser)
                        }
                        self.start = true;

                    }, label: {
                        Text("Start")
                            .foregroundColor(.white)
                    })
                    NavigationLink(isActive: $start, destination: {
                        GamePages(myUsers: self.$myUsers)
                    }, label: {})
                }
            }
        }
    }
}

struct InputPage_Previews: PreviewProvider {
    static var previews: some View {
        InputPage()
    }
}
