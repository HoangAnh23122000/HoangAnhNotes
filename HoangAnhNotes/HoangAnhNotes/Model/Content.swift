//
//  Content.swift
//  HoangAnhNotes
//
//  Created by Hoang Anh on 23/11/2023.
//

import Foundation

class Content: Encodable, Decodable, Hashable {
    var id: String = ""
    var value: String = ""
    
    static func == (lhs: Content, rhs: Content) -> Bool {
        return lhs.id == rhs.id && lhs.value == rhs.value
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(value)
    }
}

extension Encodable {
    var toDictionnary: [String: Any]?{
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    }
}
