//
//  APIHalper.swift
//  Instagram
//
//  Created by SevenInfosystem on 11/01/23.
//

import Foundation

//MARK: - API Call Link
enum APILink: String {
    case loginURL = "https://projects.seveninfosystem.com/ticketApp/public/cust/login"
    case storyURL = "https://api.unsplash.com/search/photos?query=People&client_id=uF5DcDwf1U0byec07X57Is83OP5JVkXKqOyFyW9Rz6A"
}

//MARK: - HttpMethod
enum HttpMethod: String {
    case Get      = "GET"
    case Post     = "POST"
    case Put      = "PUT"
    case Patch    = "PATCH"
    case Delete   = "DELETE"
}
