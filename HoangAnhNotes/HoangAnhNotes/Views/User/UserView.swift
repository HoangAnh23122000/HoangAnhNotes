//
//  UserView.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 01/12/2023.
//

import SwiftUI

struct UserView: View {
    
    @Binding var userName: String
    @State private var newUserName: String = ""
    @State private var isUsernameEntered: Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextEditor(text: $userName)
                    .shadow(radius: 9)
                    .frame(height: 80)
                    .padding()
                
                    NavigationLink(
                        destination: NoteListView(username: $userName).navigationBarBackButtonHidden(true),
                        isActive: $isUsernameEntered,
                        label:{
                            EmptyView()}
                    )
                
                Button {
                    saveUserName()
                    self.isUsernameEntered = true
                } label: {
                    Text("Save Username")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                .padding()
            }
            .navigationBarTitle("User Name", displayMode: .inline)
            .onAppear{
                if let saveUserName = UserDefaults.standard.string(forKey: "SaveUserName") {
                    self.userName = saveUserName
                }
                
                if !userName.isEmpty {
                    self.isUsernameEntered = true
                }
            }
        }
    }
    
    func saveUserName() {
        UserDefaults.standard.set(userName, forKey: "SaveUserName")
    }
}

//struct UserView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserView()
//    }
//}
