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
                .disableAutocorrection(true)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .padding()
                .background(Color.gray.opacity(0.08))
                .foregroundColor(Color.gray)
                .padding()
            
            Button {
                viewModel.saveNewContent(value: content)
            } label: {
                Text("Save To Your Notes List")
                    .foregroundColor(Color.white)
                    .padding(.vertical, 10)
                    .frame(minWidth: 0, maxWidth: .infinity,minHeight: 50, maxHeight: 50)
                    .background(Color.purple)
                    .cornerRadius(80)

            }
            .padding(.horizontal,20)
        }
        .background(
        LinearGradient(gradient: Gradient(stops: [
            Gradient.Stop(color: .white, location: 0.00),
            Gradient.Stop(color: Color(red:0.88, green: 0.89, blue: 0.99), location: 1.00)
        ])
                       , startPoint: .top
                       , endPoint: .bottom )
        )
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
