//
//  APIService.swift
//  Instagram
//
//  Created by SevenInfosystem on 16/01/23.
//

import Foundation


class APIService {
    
    //MARK: - varbles, typeAliyas
    typealias dictStringOfAny = [String: Any]
    
    //MARK: - basicSetUP Of API
    static func basicSetUp(
                url: APILink,
                methodName httpMethod: HttpMethod,
                parameter: dictStringOfAny? = nil) -> URLRequest? {
        
        guard let url = URL(string: url.rawValue) else {
            debugPrint("SOMETHING URL ERROR!!!")
            //complition(.failure(APIResponseError.custom("SOMETHING URL ERROR!!!")))
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        //request.addValue("XLo21661kwQoOdwT5/ntrByKvaXJp8Z0cbpXp0LqZPo=", forHTTPHeaderField: "API-KEY")
        //request.addValue("1", forHTTPHeaderField: "IS_CUSTOMER")
        
        let parameter: dictStringOfAny = parameter ?? [:]
        request.httpBody = parameter.percentEncoded()
        
        return request
    }
    /*
     basicSetUp NOTE: - If Some Prameter Added,  (like addValues for API , API Key) then add steps:-
        1. add in function parameter
        2. uncomment the 2 lines
        3. call the seprated area...
     */
}
