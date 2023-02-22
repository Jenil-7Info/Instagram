//
//  BottomPhotoGridView.swift
//  Instagram
//
//  Created by SevenInfosystem on 21/01/23.
//

import SwiftUI

struct BottomPhotoGridView: View {
    
    var column: [GridItem] = [
        GridItem(.flexible(minimum: 130, maximum: 200), spacing: nil, alignment: nil),
        GridItem(.flexible(minimum: 130, maximum: 200), spacing: nil, alignment: nil),
        GridItem(.flexible(minimum: 130, maximum: 200), spacing: nil, alignment: nil),
    ]
    
    var body: some View {
        
        //NOTE: - GalleryView
        Section {
            LazyVGrid(columns: column) {
                ForEach(0..<15) { _ in
                    Rectangle()
                        .fill(.secondary)
                        .frame(height: 150)
                        .padding(.bottom, 1)
                }
            }
        }
    }
}

struct BottomPhotoGridView_Previews: PreviewProvider {
    static var previews: some View {
        BottomPhotoGridView()
    }
}
