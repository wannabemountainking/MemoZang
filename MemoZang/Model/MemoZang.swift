//
//  MemoZang.swift
//  MemoZang
//
//  Created by yoonie on 2/22/26.
//

import Foundation
import CoreData


final class MemoZang: NSManagedObject, Identifiable {
    
    @NSManaged var title: String
    @NSManaged var content: String
    @NSManaged var createdAt: Date
    
    var isValid: Bool {
        !title.isEmpty && !content.isEmpty
    }
}

extension MemoZang {
    
    static func all() -> NSFetchRequest<MemoZang> {
        let request = NSFetchRequest<MemoZang>(entityName: "MemoZang")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \MemoZang.createdAt, ascending: false)]
        return request
    }
    
    static func empty(context: NSManagedObjectContext) -> MemoZang {
        MemoZang(context: context)
    }
}
