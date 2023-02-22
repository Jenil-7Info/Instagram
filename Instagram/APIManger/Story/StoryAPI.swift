//
//  StoryAPI.swift
//  Instagram
//
//  Created by SevenInfosystem on 16/01/23.
//

import Foundation


class StoryAPI {
    
    static func getStoryImageAPI(complition: @escaping (Result<StoryData,Error>) -> Void) {
        
        let request = APIService.basicSetUp(url: .storyURL, methodName: .Get, parameter: nil)!
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil else {
                debugPrint("ERROR:- Can't Fetch The Error!: \(String(describing: error?.localizedDescription))")
                complition(.failure(APIResponseError.custom(error?.localizedDescription ?? "Can't Fetch The Error!!!")))
                return
            }
            guard let res = response as? HTTPURLResponse else {
                debugPrint("RESPONSE ERROR:- \(String(describing: error?.localizedDescription))")
                complition(.failure(APIResponseError.custom(error?.localizedDescription ?? "RESPONSE ERROR!!!")))
                return
            }
            
            //NOTE: - Send Response
            debugPrint("RESPONSE:- \(res.statusCode)")
            
            guard let data = data else {
                debugPrint("ERROR:- DATA NOT FOUND: \(String(describing: error?.localizedDescription))")
                complition(.failure(APIResponseError.custom(error?.localizedDescription ?? "DATA NOT FOUND!!!")))
                return
            }
            do {
                let jsonDecodble = try JSONDecoder().decode(UserProfileModel.self, from: data)
                
                complition(.success(StoryData(regulerImageURL: jsonDecodble.urls.regular)))
                
                debugPrint(jsonDecodble.urls.regular)
            }
            catch {
                debugPrint("ERROR:- SOMETHINGS SYSTEM PROBLEM: \(error.localizedDescription)")
            }
        }
        .resume()
    }
}
