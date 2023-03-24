//
//  HelpView.swift
//  D&D
//
//  Created by Dylan Martin on 3/14/23.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Getting Started").foregroundColor(.gray)) {
                    NavigationLink(destination: InstructionsView()) {
                        Label("How to get started", systemImage: "play.fill")
                    }
                    .foregroundColor(.black)
                    NavigationLink(destination: TipsView()) {
                        Label("Tips", systemImage: "lightbulb.fill")
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
