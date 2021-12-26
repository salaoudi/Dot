//
//  DotApp.swift
//  Dot
//
//  Created by Zayn on 12/26/21.
//

import SwiftUI

@main
struct DotApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
