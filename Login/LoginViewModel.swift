//
//  LoginViewModel.swift
//  Login
//
//  Created by Татьяна Магнушевская on 10.10.2023.
//

import Observation
import SwiftUI

@Observable
final class LoginViewModel {
    var user = User()
    var authenticated = false
    
    private var sampleUserName = "Username"
    private var samplePassword = "Password"
    
    var isLoginButtonDusabled: Bool {
        user.name.isEmpty || user.password.isEmpty
    }
    
    func login() {
        guard user.name == sampleUserName, user.password == samplePassword else {
            return
        }
        
       togleAuthentication()
    }
    
    func logOut() {
        user.name = ""
        user.password = ""
        
        togleAuthentication()
        
    }
    
    private func togleAuthentication() {
        withAnimation {
            authenticated.toggle()
        }
        
    }
    
}
