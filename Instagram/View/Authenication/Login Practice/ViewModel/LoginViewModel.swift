//
//  LoginViewModel.swift
//  Instagram
//
//  Created by SevenInfosystem on 06/01/23.
//

import Foundation

class LoginViewModel: ObservableObject {
  
    @Published var isSucess: Bool = false
    @Published var isAlert: Bool = false
    @Published var alertMessage: String = ""
    
    func callLoginAPI(phone: String, password: String) {
        
        LoginAPI.setLoginData(phone: phone, pass: password) { result in
            switch result {
            case .success(let login):
                
                self.isSucess = true
                self.isAlert = false
                
                guard login.message != "success" else {return}
                self.alertMessage = login.message
                
            case .failure(let failure):
                
                self.isSucess = false
                self.isAlert = true
                
                self.alertMessage = (failure as! APIResponseError).errorDes ?? "Please Try Agian"
            }
        }
    }
}
