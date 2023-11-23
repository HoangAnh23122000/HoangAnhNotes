//
//  AddNoteViewModel.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 23/11/2023.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class AddNoteViewModel: ObservableObject {
    
    private let ref = Database.database().reference()
    private var number = 0
    
    func saveNewContent(value: String) {
        let content = Content()
        content.id = String(number)
        content.value = value
        ref.childByAutoId().setValue(content.toDictionnary)
        number+=1
    }
    
}
