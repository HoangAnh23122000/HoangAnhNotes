//
//  AddNoteViewModel.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 23/11/2023.
//

import Foundation

class AddNoteViewModel: ObservableObject {
    let currentDateString: String = {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: currentDate)
    }()

    func saveNote(content: String) {
        FirebaseDatabase.shared.saveNote(content: content, date: currentDateString)
    }
}
