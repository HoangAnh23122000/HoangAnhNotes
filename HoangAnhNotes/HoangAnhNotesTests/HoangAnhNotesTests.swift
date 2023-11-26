//
//  HoangAnhNotesTests.swift
//  HoangAnhNotesTests
//
//  Created by Hoang Anh on 22/11/2023.
//

import XCTest
@testable import HoangAnhNotes

final class HoangAnhNotesTests: XCTestCase {
    private let firebaseDatabaseMock = FirebaseDatabaseMock()
    private var noteListViewModel: NoteListViewModel?
    private var addNoteViewModel: AddNoteViewModel?

    override func setUp() {
        super.setUp()
        noteListViewModel = NoteListViewModel(firebaseDatabase: firebaseDatabaseMock)
        addNoteViewModel = AddNoteViewModel(firebaseDatabase: firebaseDatabaseMock)
    }

    override func tearDown() {
        noteListViewModel = nil
        addNoteViewModel = nil
        super.tearDown()
    }
    
    func testGetNoteList() {
        // test initial count
        noteListViewModel?.getNoteList()
        var count = noteListViewModel?.noteList.count ?? 0
        XCTAssertEqual(firebaseDatabaseMock.noteList.count, count, "Count must equal!")
        
        // test after saved 2 items
        firebaseDatabaseMock.saveNote(content: "test content1", date: Date.currentDateString)
        firebaseDatabaseMock.saveNote(content: "test content2", date: Date.currentDateString)
        count += 2
        XCTAssertEqual(firebaseDatabaseMock.noteList.count, count, "After saved 2 items, count in database must equal!")
        
        noteListViewModel?.getNoteList()
        XCTAssertEqual(noteListViewModel?.noteList.count, count, "After saved 2 items, count in viewModel must equal!")
        
        // test after remove the second item
        firebaseDatabaseMock.noteList.remove(at: 1)
        count -= 1
        XCTAssertEqual(firebaseDatabaseMock.noteList.count, count, "After remove 1 item, count in database must equal!")
        
        noteListViewModel?.getNoteList()
        XCTAssertEqual(noteListViewModel?.noteList.count, count, "After remove 1 item, count in viewModel must equal!")
    }

    func testAddNote() {
        noteListViewModel?.getNoteList()
        let noteListCount = noteListViewModel?.noteList.count ?? 0
        
        // saveNote
        let content = "test content"
        addNoteViewModel?.saveNote(content: "test content")
        noteListViewModel?.getNoteList()
        
        // test some asserts to ensure recent note saved successfully
        XCTAssertEqual(noteListViewModel?.noteList.count, noteListCount + 1, "Count must equal!")
        XCTAssertEqual(noteListViewModel?.noteList.last?.content, content, "Content must equal!")
        XCTAssertEqual(noteListViewModel?.noteList.last?.date, addNoteViewModel?.currentDateString, "Date must equal!")
    }
    
    func testDeleteNote() {
        let content = "test content"
        addNoteViewModel?.saveNote(content: "test content")
        
        // test recent added note exist
        let lastNote = firebaseDatabaseMock.noteList.last
        XCTAssertNotNil(lastNote, "Can't get recent added note!")
        
        // test recent note deleted successfully
        guard let lastNote = lastNote else { return }
        noteListViewModel?.deleteNote(lastNote)
        XCTAssertFalse(firebaseDatabaseMock.noteList.contains(where: { $0.id == lastNote.id }), "Recent deleted note still exist!")
    }
}

// MARK: FirebaseDatabaseMock
class FirebaseDatabaseMock: FirebaseDatabaseProtocol {
    var noteList: [Note] = []
    
    func getNoteList(completion: @escaping ([HoangAnhNotes.Note]) -> Void) {
        completion(noteList)
    }
    
    func saveNote(content: String, date: String) {
        let note = Note(id: UUID().uuidString, content: content, date: date)
        noteList.append(note)
    }
    
    func deleteNote(withId noteId: String) {
        noteList.removeAll(where: { $0.id == noteId })
    }
}
