//
//  ListContentNotesView.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 24/11/2023.
//

import SwiftUI

struct ListContentNotesView: View {
    
    @StateObject var viewModel = ListContentNotesViewModel()
    
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
                                Text("Tiếp")
                            }
                        }
                    }
                
                ScrollView {
                    LazyVStack(spacing: -5) {
                        if !viewModel.listContents.isEmpty {
                            ForEach(viewModel.listContents, id: \.self) { index in
                                VStack {
                                    Spacer()
                                    Text(index.value)
                                        .padding(.horizontal, 5)
                                        .padding(.trailing, 10)
                                        .frame(maxWidth: .infinity)
                                        .background(Color.red)
                                        .lineLimit(nil)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct ListContentNotesView_Previews: PreviewProvider {
    static var previews: some View {
        ListContentNotesView()
    }
}
