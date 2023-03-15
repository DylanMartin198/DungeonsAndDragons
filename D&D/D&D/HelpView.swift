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
                Section(header: Text("Getting Started")) {
                    NavigationLink(destination: Text("Instructions on how to get started")) {
                        Label("How to get started", systemImage: "play.fill")
                    }
                    NavigationLink(destination: Text("Tips on using the app")) {
                        Label("Tips", systemImage: "lightbulb.fill")
                    }
                }
                Section(header: Text("Account")) {
                    NavigationLink(destination: Text("How to create an account")) {
                        Label("Create an account", systemImage: "person.crop.circle.badge.plus")
                    }
                    NavigationLink(destination: Text("How to reset your password")) {
                        Label("Reset Password", systemImage: "lock.rotation")
                    }
                }
                Section(header: Text("Contact Us")) {
                    NavigationLink(destination: Text("Contact us with any questions or concerns")) {
                        Label("Contact Us", systemImage: "envelope.fill")
                    }
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
