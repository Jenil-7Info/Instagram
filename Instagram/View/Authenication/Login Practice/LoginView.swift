//
//  LoginView.swift
//  Instagram
//
//  Created by SevenInfosystem on 04/01/23.
//

import SwiftUI

struct LoginView: View {
    
    //MARK: - Variables And Objects
    @State private var phoneErrorMessage: String = ""
    @State private var passErrorMessage: String = ""
    @State private var isHidePass: Bool = true
    @State private var isPhoneErrorShow: Bool = false
    @State private var isPassErrorShow: Bool = false
    @State private var phoneNo: String = ""
    @State private var password: String = ""
    @StateObject var loginViewModel = LoginViewModel()
    
    //MARK: - Body
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.blue
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .opacity(0.2)
                Circle()
                    .scale(1.25)
                    .foregroundColor(.white)
                
                VStack(alignment: .center) {
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                    
                    TextField("Phone Number", text: $phoneNo)
                        .padding(.horizontal)
                        .frame(width: 325, height: 55)
                        .background(.black.opacity(0.05))
                        .cornerRadius(25)
                        .padding([.top, .horizontal])
                        .autocorrectionDisabled(true)
                    
                    if isPhoneErrorShow {
                        Text(phoneErrorMessage)
                            .foregroundColor(.red)
                    }
                    
                    HStack {
                        if isHidePass {
                            SecureField("Password", text: $password)
                                .padding(.horizontal)
                                .frame(width: 270 ,height: 55)
                                .autocorrectionDisabled(true)
                            Image(systemName: isHidePass ? "eye.slash.fill" : "eye.fill")
                                .padding(.trailing, 25)
                                .onTapGesture {
                                    isHidePass.toggle()
                                }
                        }
                        else {
                            TextField("Password", text: $password)
                                .padding(.horizontal)
                                .frame(width: 270 ,height: 55)
                                .autocorrectionDisabled(true)
                            Image(systemName: isHidePass ? "eye.slash.fill" : "eye.fill")
                                .padding(.trailing, 25)
                                .onTapGesture {
                                    isHidePass.toggle()
                                }
                        }
                    }
                    .background(.black.opacity(0.05))
                    .cornerRadius(30)
                    .padding(.top, 10)
                    .padding(.horizontal, 24)
                    
                    if isPassErrorShow {
                        Text(passErrorMessage)
                            .foregroundColor(.red)
                    }
                    
                    //MARK: - Login Button
                    Button {
                        validationLoginBtn()
                    } label: {
                        Text("Login")
                            .frame(width: 320, height: 55)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                            .font(.title3)
                            .bold()
                    }
                    .padding(.top, 30)
                    .navigationDestination(isPresented: $loginViewModel.isSucess) {
                        InstagramMainPage()
                    }
                    .alert("Alert", isPresented: $loginViewModel.isAlert) {
                        Button("OK") {
                            loginViewModel.isAlert = false
                        }
                    } message: {
                        Text(loginViewModel.alertMessage)
                    }
                }
            }
        }
    }
    
    //MARK: - Validation
    private func validationLoginBtn() {
        
        if phoneNo.isEmpty && password.isEmpty {
            isPhoneErrorShow = true
            phoneErrorMessage = "Please Enter Your Phone"
            isPassErrorShow = true
            passErrorMessage = "Please Enter Your Password"
            phoneNo = ""
            password = ""
        }
        else if phoneNo.isEmpty {
            isPhoneErrorShow = true
            isPassErrorShow =  false
            phoneErrorMessage = "Please Enter Your Phone"
            phoneNo = ""
        }
        else if password.isEmpty {
            isPassErrorShow = true
            isPhoneErrorShow =  false
            passErrorMessage = "Please Enter Your Password"
            password = ""
        }
        else if phoneNo.count != 10 {
            isPhoneErrorShow = true
            isPassErrorShow = false
            phoneErrorMessage = "Please Enter Only 10 digit Number"
            phoneNo = ""
            password = ""
        }
        else {
            isPhoneErrorShow = false
            isPassErrorShow = false
        
            //NOTE: - ViewModel Function call
            loginViewModel.callLoginAPI(phone: phoneNo, password: password)
            
            phoneNo = ""
            password = ""
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
