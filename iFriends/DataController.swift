//
//  DataController.swift
//  iFriends
//
//  Created by Philipp Sanktjohanser on 24.12.22.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "iFriends")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
