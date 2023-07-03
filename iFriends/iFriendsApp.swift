//
//  iFriendsApp.swift
//  iFriends
//
//  Created by Philipp Sanktjohanser on 24.12.22.
//

import SwiftUI

@main
struct iFriendsApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
