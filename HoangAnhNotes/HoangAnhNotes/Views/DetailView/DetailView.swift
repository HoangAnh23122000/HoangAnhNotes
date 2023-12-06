//
//  DetailView.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 02/12/2023.
//

import SwiftUI

struct DetailView: View {
//    var content: Note
//    @Binding var editContent: String
    @Binding var note: Note
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            TextEditor(text: $note.content)
                .frame(minHeight: 200)
                .padding()
            
            Button {
                dismiss()
            } label: {
                Text("Save content")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50, maxHeight: 50)
                    .background(Color.purple)
                    .cornerRadius(80)
                    .overlay {
                        RoundedRectangle(cornerRadius: 80)
                            .stroke(Color.black, lineWidth: 0.5)
                    }
            }
            .padding(.horizontal, 20)
            
        }
        .padding()
//        .onAppear {
//            editContent = content.content
//        }
        .navigationBarTitle("Detail View")
        
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(content: Note)
//    }
//}
