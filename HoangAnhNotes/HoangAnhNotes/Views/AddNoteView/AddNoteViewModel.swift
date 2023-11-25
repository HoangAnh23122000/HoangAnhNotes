//
//  AddNoteViewModel.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 23/11/2023.
//

import Foundation

class AddNoteViewModel: ObservableObject {
    let currentDateString = Date.currentDateString

    func saveNote(content: String) {
        FirebaseDatabase.shared.saveNote(content: content, date: currentDateString)
    }
}
