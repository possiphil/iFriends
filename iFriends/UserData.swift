//
//  UserData.swift
//  iFriends
//
//  Created by Philipp Sanktjohanser on 24.12.22.
//

import Foundation

struct Friend: Codable {
    let id: String
    let name: String
}

struct User: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: String
    let tags: [String]
    let friends: [Friend]
}
