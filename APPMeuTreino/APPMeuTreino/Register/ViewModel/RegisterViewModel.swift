//
//  RegisterViewModel.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 17/05/23.
//

import UIKit
import Firebase

protocol RegisterViewModelProtocol: AnyObject {
    func sucessRegister()
    func errorRegister(errorMessage: String)
        
    
}

class RegisterViewModel {
    private weak var delegate: RegisterViewModelProtocol?
    public func delegate (delegate: RegisterViewModelProtocol?) {
        self.delegate = delegate
    }
    
    private var auth = Auth.auth()
    
    
    
    public func registerUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("Sucesso cadastro")
            }else {
                print("Error cadastro, error: \(error?.localizedDescription ?? "")")
            }
        }
    }
}



