//
//  RegisterView.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 06/12/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @Binding var currentShowing: String
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Create Your Note")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Spacer()
                
                HStack {
                    Image(systemName: "mail")
                    TextField("Email", text: $email)
                    
                    Spacer()
                    
                    if email.count != 0 {
                        Image(systemName: email.isValidEmail() ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(email.isValidEmail() ? .green : .red)
                    }
                }
                .foregroundColor(.white)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2 )
                        .foregroundColor(.white)
                }
                .padding()
                
                HStack {
                    Image(systemName: "lock")
                    SecureField("Password", text: $password)
                    
                    if password.count != 0 {
                        Image(systemName: password.isValidPassword(password) ? "checkmark" : "xmark")
                            .fontWeight(.bold)
                            .foregroundColor(password.isValidPassword(password) ? .green : .red)
                    }
                    
                }
                .foregroundColor(.white)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .foregroundColor(.white)
                }
                .padding()
                
                Button {
                    withAnimation {
                        self.currentShowing = "login"
                    }
                } label: {
                    Text("Already have an account?")
                        .foregroundColor(.gray.opacity(0.7))
                }
                
                Spacer()
                Spacer()
                
                Button {
                    print("")
                } label: {
                    Text("Create New Account")
                        .foregroundColor(.black)
                        .font(.title3)
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                        )
                        .padding(.horizontal)
                }
                
            }
        }
    }
}
//
//struct RegisterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterView(currentShowing: "")
//    }
//}
