//
//  D_DApp.swift
//  D&D
//
//  Created by Dylan Martin on 3/3/23.
//

import SwiftUI

@main
struct D_DApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
