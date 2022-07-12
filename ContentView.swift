//
//  ContentView.swift
//  Shared
//
//  Created by Nguyên Trần on 08/07/2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        NavigationView {
            MainView()
                .onAppear {
                    UINavigationBar.appearance().isHidden = true
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
