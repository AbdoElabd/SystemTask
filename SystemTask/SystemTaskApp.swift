//
//  SystemTaskApp.swift
//  SystemTask
//
//  Created by abdelrahman elabd on 21/03/2023.
//

import SwiftUI

@main
struct SystemTaskApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
