//
//  LoginViewModel.swift
//  Instagram
//
//  Created by SevenInfosystem on 04/01/23.
//

import SwiftUI


//MARK: - Login API Call
struct LoginAPI {
    
    static func setLoginData(phone: String, pass: String, complition: @escaping ((Result<LoginData, Error>) -> Void)) {
        
        let para: [String: Any] = [
            "phone": phone ,
            "password" : pass
        ]
        
        let request = APIService.basicSetUp(url: .loginURL, methodName: .Post, parameter: para)!
        
        URLSession.shared.dataTask(with: request) { Data, response, error in
            DispatchQueue.main.async {
                
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
                
                guard let data = Data else {
                    debugPrint("ERROR:- DATA NOT FOUND: \(String(describing: error?.localizedDescription))")
                    complition(.failure(APIResponseError.custom(error?.localizedDescription ?? "DATA NOT FOUND!!!")))
                    return
                }
                
                do {
                    
                    let jsonDecodeble = try JSONDecoder().decode(UserList.self, from: data)
                    
                    switch jsonDecodeble.code {
                    case 0:
                        complition(.success(LoginData(name: nil, email: nil, contact: nil, token: nil, message: jsonDecodeble.message)))
                        //debugPrint(jsonDecodeble.message)
                        
                    case 1:
                        complition(.success(LoginData(name: jsonDecodeble.data.name, email: jsonDecodeble.data.email, contact: jsonDecodeble.data.contact, token: jsonDecodeble.data.token, message: jsonDecodeble.message)))
                        //debugPrint(jsonDecodeble.message)
                        
                    default :
                        complition(.failure(APIResponseError.custom(error?.localizedDescription ?? "BACKGROUND RESPONSE PROBLEM!!!")))
                        //debugPrint("BACKGROUND RESPONSE PROBLEM!!!")
                        break
                    }
                    
                }
                catch {
                    
                    //NOTE: - System Error
                    debugPrint("ERROR:- SOMETHINGS WRONG: \(error.localizedDescription)")
                    complition(.failure(APIResponseError.custom(error.localizedDescription)))
                }
            }
        }
        .resume()
    }
}
