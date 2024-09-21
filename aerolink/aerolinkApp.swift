//
//  aerolinkApp.swift
//  aerolink
//
//  Created by asadbek on 21/09/24.
//

import SwiftUI

@main
struct aerolinkApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
