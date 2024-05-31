//
//  User.swift
//  CodePlayground
//
//  Created by Александр Новиков on 28.05.2024.
//

import Foundation

class User: Identifiable, Codable  {
    var id: String
    var firstName: String
    var lastName: String
    var nickName: String
    var email: String
    var projects: [ProjectViewModel] = []

    init(id: String, firstName: String, lastName: String, nickName: String, email: String) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.nickName = nickName
        self.email = email
    }
}
