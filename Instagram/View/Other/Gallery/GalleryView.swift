//
//  GalleryView.swift
//  Instagram
//
//  Created by SevenInfosystem on 04/01/23.
//

import SwiftUI

struct GalleryView: View {
    var column: [GridItem] = [
        GridItem(.fixed(130), spacing: nil, alignment: nil),
        GridItem(.flexible(minimum: 130, maximum: 200), spacing: nil, alignment: nil),
        GridItem(.adaptive(minimum: 150), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        ScrollView {
            Rectangle()
                .fill(.gray)
                .frame(width: 400, height: 400)
            
            Section(header: Text("Gallery")) {
                LazyVGrid(columns: column) {
                    ForEach(0..<51) { _ in
                        Rectangle()
                            .fill(.secondary)
                            .frame(height: 150)
                    }
                }
            }
        }
        .navigationTitle("New Post")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    //TextfiledView()
                    //.navigationTitle("Apple Id")
                } label: {
                    Image(systemName: "arrow.right")
                        .font(.title3)
                }
            }
        }
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
