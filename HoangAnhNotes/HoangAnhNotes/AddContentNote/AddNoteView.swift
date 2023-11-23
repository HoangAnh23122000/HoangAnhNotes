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
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .padding()
                .background(Color.red.opacity(0.2))
                .foregroundColor(Color.gray)
                .padding()
            
            Button {
                viewModel.saveNewContent(value: content)
            } label: {
                Text("Save")
//                    .offset(x:20 , y: 32)
//                    .frame(width: .infinity, height: .infinity)
//                    .background(Color.purple)
                    .padding()
            }
        }
        .frame(width: .infinity, alignment: .top)
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
