//
//  NoteListViewModel.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 24/11/2023.
//

import Foundation

class NoteListViewModel: ObservableObject {
    @Published var noteList: [Note] = []
    
    func getNoteList() {
        FirebaseDatabase.shared.getNoteList { noteList in
            self.noteList = noteList
        }
    }
    
    func deleteNote(at index: Int) {
        let noteToDelete = noteList[index]
        FirebaseDatabase.shared.deleteNote(withId: noteToDelete.id)
    }
}
