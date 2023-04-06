//
//  facebookLoginMangerViewModel.swift
//  Instagram
//
//  Created by SevenInfosystem on 28/03/23.
//

import SwiftUI
import Foundation
import FBSDKLoginKit

class facebookLoginMangerViewModel: ObservableObject {
    
    @Published var isAlert: Bool = false
    @Published var errMessage: String = ""
    @AppStorage("isLogIn") var isLogin: Bool = false
    @AppStorage("email") var email: String = ""
    let manger = LoginManager()
    
    func SignInWithFacebook() {
        manger.logIn(permissions: ["public_profile", "email"], from: nil) { result, error in
            
            if error != nil {
                self.isLogin = false
                self.isAlert = true
                self.errMessage = error?.localizedDescription ?? "ERROR:- Facebook Not Login"
                debugPrint(error?.localizedDescription ?? "ERROR:- Facebook Not Login")
            }
            
            //getting user detaild using FB Graph Request...
            let request = GraphRequest(graphPath: "me", parameters: ["fileds" : "email"])
            request.start { _, result, error in
                
                //Errors...
                if error != nil {
                    self.isLogin = false
                    self.isAlert = true
                    self.errMessage = error?.localizedDescription ?? "ERROR:- Facebook Graph Request Problem"
                    debugPrint(error?.localizedDescription ?? "ERROR:- Facebook Graph Request Problem")
                }
                
                //it will return as dictonery...
                guard let profilData = result as? [String:Any] else { return }
                
                //saving email useing the AppStorage
                self.email = profilData["email"] as! String
                
                //Sucessfully Login...
                self.isLogin = true
            }
        }
    }
    
    func SignOut() {
        manger.logOut()
        self.isLogin = false
    }
}
