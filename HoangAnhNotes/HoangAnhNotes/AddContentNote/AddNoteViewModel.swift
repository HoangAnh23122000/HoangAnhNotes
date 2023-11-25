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
        content.date = getCurrentDate()
        ref.childByAutoId().setValue(content.toDictionnary)
        number+=1
    }
    
    func getCurrentDate() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: currentDate)
    }
}
