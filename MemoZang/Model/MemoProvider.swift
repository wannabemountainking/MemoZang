//
//  MemoProvider.swift
//  MemoZang
//
//  Created by yoonie on 2/22/26.
//

import Foundation
import CoreData


final class MemoProvider {
    
    static let shared = MemoProvider()
    
    let container: NSPersistentContainer
    var context: NSManagedObjectContext {
        container.viewContext
    }
    var newContext: NSManagedObjectContext {
        let tempContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        tempContext.persistentStoreCoordinator = container.persistentStoreCoordinator
        return tempContext
    }
    
    private init() {
        self.container = NSPersistentContainer(name: "MemoDataStorage")
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.loadPersistentStores { description, error in
            if let error {
                print("ERROR Loading Core Data: \(error)")
            } else {
                print("Successfully loaded Core Data: \(description)")
            }
        }
    }
    
    func exist(context: NSManagedObjectContext, memoZang: MemoZang) -> MemoZang? {
        try? context.existingObject(with: memoZang.objectID) as? MemoZang
    }
}
