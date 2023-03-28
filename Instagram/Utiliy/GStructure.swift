//
//  GStructure.swift
//  Instagram
//
//  Created by SevenInfosystem on 16/01/23.
//

import Foundation
import SwiftUI

//MARK: - Display SystemImage And Text
struct NameOfScreenWithSystemImage: View {
    
    var systemImage: String
    var text : String
    var imageWidth: CGFloat = 30
    var imageHeight: CGFloat = 30
    
    var body: some View {
        HStack {
            Image(systemName: systemImage)
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
                .foregroundColor(.black)
            Text(text)
                .font(.system(size: 18))
                .foregroundColor(.black)
            Spacer()
        }
        .padding(9)
    }
}

//MARK: - Display IconImage And Text
struct NameOfScreenWithFaltIconImage: View {
    
    var image: String
    var text : String
    var imageWidth: CGFloat = 30
    var imageHeight: CGFloat = 30
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: imageWidth, height: imageHeight)
                .foregroundColor(.black)
            Text(text)
                .font(.title2)
                .foregroundColor(.black)
            Spacer()
        }
        .padding()
    }
}
