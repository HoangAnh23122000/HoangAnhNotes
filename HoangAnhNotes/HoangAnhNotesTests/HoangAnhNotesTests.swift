//
//  HoangAnhNotesTests.swift
//  HoangAnhNotesTests
//
//  Created by Hoang Anh on 22/11/2023.
//

import XCTest
@testable import HoangAnhNotes

final class HoangAnhNotesTests: XCTestCase {
    private var noteListViewModel: NoteListViewModel?
    private var addNoteViewModel: AddNoteViewModel?

    override func setUp() {
        super.setUp()
        noteListViewModel = NoteListViewModel()
        addNoteViewModel = AddNoteViewModel()
    }
    
    override func tearDown() {
        noteListViewModel = nil
        addNoteViewModel = nil
        super.tearDown()
    }
//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testAddNote() {
        let noteListCount = noteListViewModel?.noteList.count
        let content = "test content"
        addNoteViewModel?.saveNote(content: content)
        
        XCTAssertEqual(noteListViewModel?.noteList.count, noteListCount + 1)
        XCTAssertEqual(noteListViewModel?.noteList.last?.content, content)
        XCTAssertEqual(noteListViewModel?.noteList.last?.date, addNoteViewModel?.currentDateString)
    }
    
//    func testExample() throws {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        // Any test you write for XCTest can be annotated as throws and async.
//        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
//        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
