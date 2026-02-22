//
//  MemoZangViewModel.swift
//  MemoZang
//
//  Created by yoonie on 2/22/26.
//

import Foundation
import CoreData
import Combine


final class MemoZangViewModel: ObservableObject {
    
    @Published var memoZang: MemoZang
    @Published var isNew: Bool
    
    let provider: MemoProvider
    var context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext, memoZang: MemoZang? = nil) {
        self.provider = MemoProvider.shared
        self.context = provider.newContext
        
        if let memoZang, let existingMemo = provider.exist(context: self.context, memoZang: memoZang) {
            self.memoZang = existingMemo
            self.isNew = false
        } else {
            self.memoZang = MemoZang.empty(context: self.context)
            self.isNew = true
        }
    }
    
    private func save() {
        do {
            try self.context.save()
        } catch {
            print("ERROR SAVING IN CORE DATA: \(error)")
        }
    }
}
