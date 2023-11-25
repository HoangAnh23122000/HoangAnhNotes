//
//  NoteListView.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 24/11/2023.
//

import SwiftUI

struct NoteListView: View {
    
    @StateObject var viewModel = NoteListViewModel()
    
    init() {
        viewModel.observerListContent()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("")
                    .navigationBarTitle("Your Note List", displayMode: .inline)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: AddNoteView()) {
                                Text("Add Note")
                                    .foregroundColor(Color.black)
                            }
                        }
                    }
                
                ScrollView {
                    LazyVStack(spacing: 15) {
                        if !viewModel.listContents.isEmpty {
                            ForEach(viewModel.listContents, id: \.self) { index in
                                VStack(alignment: .leading) {
                                    Text(index.date)
                                        .font(.system(size: 15))
                                        .frame(alignment: .leading)
                                        .padding(.leading, 5)
    
                                    Spacer()
                                    
                                    Text(index.value)
                                        .font(.system(size: 15))
                                        .foregroundColor(Color(red:0.43, green: 0.46, blue: 0.57))
                                        .padding(.horizontal, 5)
                                        .padding(.trailing, 10)
                                        .frame(maxWidth: .infinity, alignment: .topLeading)
                                        .background(Color.white)
                                        .cornerRadius(12)
                                        .lineLimit(nil)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color.black, lineWidth: 0.5)
                                        )
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding()
                }
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
        .accentColor(.black)
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView()
    }
}
