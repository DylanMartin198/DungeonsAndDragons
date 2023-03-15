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
                Section(header: Text("Getting Started").foregroundColor(.black)) {
                    NavigationLink(destination: Text("Instructions on how to get started")) {
                        Label("How to get started", systemImage: "play.fill")
                    }
                    .foregroundColor(.black)
                    NavigationLink(destination: Text("Tips on using the app")) {
                        Label("Tips", systemImage: "lightbulb.fill")
                    }
                    .foregroundColor(.black)
                }
                Section(header: Text("Account").foregroundColor(.black)) {
                    NavigationLink(destination: Text("How to create an account")) {
                        Label("Create an account", systemImage: "person.crop.circle.badge.plus")
                    }
                    .foregroundColor(.black)
                    NavigationLink(destination: Text("How to reset your password")) {
                        Label("Reset Password", systemImage: "lock.rotation")
                    }
                    .foregroundColor(.black)
                }
                Section(header: Text("Contact Us").foregroundColor(.black)) {
                    NavigationLink(destination: Text("Contact us with any questions or concerns")) {
                        Label("Contact Us", systemImage: "envelope.fill")
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
