//
//  GEnum.swift
//  Instagram
//
//  Created by SevenInfosystem on 06/01/23.
//

import Foundation


//MARK: - APIError
enum APIResponseError: Error {
    case custom(String)
    
    var errorDes: String? {
        switch self {
            case .custom(let message): return NSLocalizedString(message, comment: "Custom Error")
        }
    }
}
