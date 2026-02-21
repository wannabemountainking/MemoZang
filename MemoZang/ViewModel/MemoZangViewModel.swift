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
        
    }
}
