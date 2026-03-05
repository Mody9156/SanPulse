//
//  CoreDataStack.swift
//  SanPulse
//
//  Created by Modibo on 05/03/2026.
//

import Foundation
import Observation
import CoreData

@Observable
class CoreDataStack {
    static let share = CoreDataStack()
    
    var PersistentContainer : NSPersistentContainer {
        let container = NSPersistentContainer(name: "Model")
        
        container.loadPersistentStores { _ , error in
            if let error {
                fatalError("Failed to load persistent stores: \(error.localizedDescription)")
            }
        }
        
        return container
    }()
    
    private ini(){}
}
