//
//  FanboyloveApp.swift
//  Shared
//
//  Created by Nguyên Trần on 08/07/2022.
//

import SwiftUI

import Firebase

@main
struct FanboyloveApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
