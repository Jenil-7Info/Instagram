//
//  StoryModel.swift
//  Instagram
//
//  Created by SevenInfosystem on 16/01/23.
//

import Foundation
import UIKit

// MARK: - UserProfileModel
struct UserProfileModel: Decodable {
    let id: String
    let width, height: Int
    let color, blurHash: String
    let description: String?
    let altDescription: String
    let urls: Urls
}
  
// MARK: - Urls
struct Urls: Decodable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}

