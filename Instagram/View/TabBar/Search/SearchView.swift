//
//  SearchView.swift
//  Instagram
//
//  Created by SevenInfosystem on 12/01/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var search: String = ""
    var column: [GridItem] = [
        GridItem(.fixed(130), spacing: nil, alignment: nil),
        GridItem(.flexible(minimum: 130, maximum: 200), spacing: nil, alignment: nil),
        GridItem(.adaptive(minimum: 150), spacing: nil, alignment: nil)
    ]
    
    var body: some View {
        VStack {
            
            //MARK: - Title
            HStack {
                Text("Search")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding([.top, .horizontal])
            
            //MARK: - Search TextFiled
            HStack {
                TextField("search here...", text: $search)
                if !search.isEmpty {
                    Button {
                        search = ""
                    } label: {
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.horizontal)
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.gray.opacity(0.2))
                    .frame(height: 40)
            }
            .padding([.horizontal, .bottom])
            
            //MARK: - Grid View
            ScrollView {
                Section {
                    LazyVGrid(columns: column) {
                        ForEach(0..<51) { _ in
                            Rectangle()
                                .fill(.secondary)
                                .frame(height: 150)
                        }
                        
                    }
                    .padding(.top)
                }
            }
            .scrollIndicators(.never)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
