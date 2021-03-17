//
//  HotCoffeeAppApp.swift
//  HotCoffeeApp
//
//  Created by Jacob LeCoq on 3/14/21.
//

import SwiftUI

@main
struct HotCoffeeAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
