//
//  HelpView.swift
//  D&D
//
//  Created by Dylan Martin on 3/14/23.
//

import SwiftUI

struct HelpView: View {
    @Environment(\.presentationMode) var presentationMode
    
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
            .navigationTitle("Help")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.blue)
                            .imageScale(.large)
                    }
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Back")
                            .foregroundColor(.blue)
                    }
                }
            )
        }
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
