//
//  Date+.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 25/11/2023.
//

import Foundation

extension Date {
    static var currentDateString: String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: currentDate)
    }
}

extension String {
    
    func isValidEmail() -> Bool {
        //Test@email.com -> true
        //Test .com -> false
        
        let emailRegex = try! NSRegularExpression(pattern:
        "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
     
        return emailRegex.firstMatch(in: self, range: NSRange(location: 0, length: count)) != nil
    }
    
    func isValidPassword(_ password: String) -> Bool {
        // minium 6 characters long
        // 1 uppercase character
        // 1 special char
        
        let passwordRegex = NSPredicate(format:"SELF MATCHES %@","^(?=.*[a-z])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
        
        return passwordRegex.evaluate(with: password)
    }
}
