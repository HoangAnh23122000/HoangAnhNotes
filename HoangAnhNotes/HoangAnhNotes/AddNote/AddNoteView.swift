//
//  AddNoteView.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 23/11/2023.
//

import SwiftUI

struct AddNoteView: View {
    
    @StateObject
    var viewModel = AddNoteViewModel()
    
    @State
    var content: String = ""
    
    var body: some View {
        VStack {
            TextEditor(text: $content)
                .frame(width: .infinity, height: 50)
                .padding()
            
            Button {
                viewModel.saveNewContent(value: content)
            } label: {
                Text("Save")
                    .padding()
            }
        }.frame(width: .infinity, alignment: .top)
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
