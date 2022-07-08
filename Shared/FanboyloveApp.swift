//
//  FanboyloveApp.swift
//  Shared
//
//  Created by Nguyên Trần on 08/07/2022.
//

import SwiftUI

@main
struct FanboyloveApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
