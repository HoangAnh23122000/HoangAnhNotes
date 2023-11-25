//
//  NoteListViewModel.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 24/11/2023.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class NoteListViewModel: ObservableObject {
    
    private let ref = Database.database().reference()
    
    @Published
    var content: Content? = nil
    
    @Published
    var listContents = [Content]()
    
    init(){
        observerListContent()
    }
    
    func observerListContent(){
        ref.observe(.value) { parentSnapshot in
            guard let children = parentSnapshot.children.allObjects as? [DataSnapshot] else {
                // incase it not
                return
            }
            
            self.listContents = children.compactMap({ snapshot in
                return try? snapshot.data(as: Content.self)
            })
        }
    }
}
