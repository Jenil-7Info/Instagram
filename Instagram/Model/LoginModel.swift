//
//  LoginModel.swift
//  Instagram
//
//  Created by SevenInfosystem on 07/01/23.
//

import Foundation
import UIKit

// MARK: - UserList
struct UserList: Decodable {
    
    let code: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Decodable {
    let id, name, contact, email: String
    let avatar = UIImage()
    let password, eventID: String
    //let ticketLink, ticketID, mailStatus, attendedTime: JSONNull?
    //let createdBy: JSONNull?
    let createdFrom, status, isDeleted, createdAt: String
    let updatedAt, token: String

    enum CodingKeys: String, CodingKey {
        case id, name, contact, email, password
        case eventID = "event_id"
        case createdFrom = "created_from"
        case status
        case isDeleted = "is_deleted"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case token
    }
}
