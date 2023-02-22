//
//  StoryViewModel.swift
//  Instagram
//
//  Created by SevenInfosystem on 16/01/23.
//

import Foundation
import Kingfisher


class StoryViewModel : ObservableObject {
    
    @Published var imageURL: [StoryData] = []
    
    func callStoryAPI() {
        StoryAPI.getStoryImageAPI { result in
            switch result {
            case .success(let success):
                self.imageURL.append(StoryData(regulerImageURL: success.regulerImageURL))
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
        
        debugPrint(imageURL)
    }
}
