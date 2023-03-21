//
//  ContentView.swift
//  D&D
//
//  Created by Dylan Martin on 3/3/23.
//

import SwiftUI

struct ContentView: View {
    @State private var playerName = ""
    @State private var navigateToQuestView: Bool = false
    var body: some View {
        ZStack {
            Image("CoolBackground")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Welcome to D&D Quest!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                
                Button("Start Game") {
                    self.navigateToQuestView = true
                }.sheet(isPresented: self.$navigateToQuestView, content: {
                    QuestView()
                })
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
