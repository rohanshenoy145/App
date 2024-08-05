//
//  I_am_Rich2App.swift
//  I am Rich2
//
//  Created by Rohan Shenoy on 6/13/24.
//

import SwiftUI

@main
struct I_am_Rich2App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
