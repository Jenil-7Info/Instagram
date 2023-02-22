//
//  GStructure.swift
//  Instagram
//
//  Created by SevenInfosystem on 16/01/23.
//

import Foundation

//MARK: - Login data
struct LoginData {
    
    var name: String = ""
    var email: String = ""
    var contact: String = ""
    var token: String = ""
    var message: String = ""
    
    init(name: String?, email: String?, contact: String?, token: String?, message: String?) {
        self.name = name ?? ""
        self.email = email ?? ""
        self.contact = contact ?? ""
        self.token = token ?? ""
        self.message = message ?? ""
    }
}

//MARK: - Story data
struct StoryData {
    
    var regulerImageURL: String = ""
    
    init(regulerImageURL: String) {
        self.regulerImageURL = regulerImageURL
    }
}
