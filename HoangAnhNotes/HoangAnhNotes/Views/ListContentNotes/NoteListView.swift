//
//  NoteListView.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 24/11/2023.
//

import SwiftUI

struct NoteListView: View {
    @StateObject private var viewModel = NoteListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if !viewModel.noteList.isEmpty {
                    List {
                        ForEach(viewModel.noteList.indices.reversed(), id: \.self) { index in
                            let note = viewModel.noteList[index]
                            noteItem(note)
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.clear)
                                .swipeActions(edge: .trailing) {
                                    Button(role: .destructive, action: {
                                        viewModel.deleteNote(note)
                                    }, label: {
                                        Label("Delete", systemImage: "trash")
                                    })
                                }
                        }
                    }
                }
            }
            .navigationBarTitle("Your Note List", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddNoteView()) {
                        HStack(spacing: 3){
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 13, height: 13)
                            Text("Add Note")
                                .foregroundColor(Color.black)
                            
                        }
                    }
                }
            }
            .background(
                LinearGradient(gradient: Gradient(
                    stops: [
                        Gradient.Stop(color: .white, location: 0.00),
                        Gradient.Stop(color: Color(red:0.88, green: 0.89, blue: 0.99), location: 1.00)
                    ]
                ), startPoint: .top, endPoint: .bottom )
            )
        }
        .accentColor(.black)
        .onAppear {
            viewModel.getNoteList()
        }
    }
    
    private func noteItem(_ note: Note) -> some View {
        VStack(alignment: .leading) {
            Text(note.date)
                .font(.system(size: 15))
                .frame(alignment: .leading)
                .padding(.leading, 5)

            Spacer()
            
            Text(note.content)
                .font(.system(size: 15))
                .foregroundColor(Color(red:0.43, green: 0.46, blue: 0.57))
                .padding(.horizontal, 5)
                .padding(.trailing, 10)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color.white)
                .cornerRadius(10)
                .lineLimit(nil)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 0.5)
                )
            Spacer()
        }
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView()
    }
}
