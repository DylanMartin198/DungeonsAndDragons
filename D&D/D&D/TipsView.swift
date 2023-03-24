//
//  TipsView.swift
//  D&D
//
//  Created by Dylan Martin on 3/20/23.
//

import SwiftUI

struct TipsView: View {
    var body: some View {
        Text("Example Headers")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
            .foregroundColor(.black)
        List {
            Section(header: Text("Take me on a D&D adventure").foregroundColor(.gray)) {
                Text("in a lost Mayan ruin")
                Text("in the French Catacombs")
                Text("in a haunted castle")
            }
            .foregroundColor(.black)
        }
    }
}

//List {
//    Section(header: Text("Getting Started").foregroundColor(.gray)) {
//        NavigationLink(destination: InstructionsView()) {
//            Label("How to get started", systemImage: "play.fill")
//        }
//        .foregroundColor(.black)
//        NavigationLink(destination: TipsView()) {
//            Label("Tips", systemImage: "lightbulb.fill")
//        }
//        .foregroundColor(.black)
//    }
//}

// Example Headers
//Take me on a D&D adventure....
//in a lost Mayan ruin
//in a haunted castle
// in the Brazilian rainForrest
// in the French Catacombs

struct TipsView_Previews: PreviewProvider {
    static var previews: some View {
        TipsView()
    }
}
