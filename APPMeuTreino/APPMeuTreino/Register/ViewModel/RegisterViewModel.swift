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
    private var fireStoreManager = FirestoreManager.shared
    private var auth = Auth.auth()
    
    public func delegate (delegate: RegisterViewModelProtocol?) {
        self.delegate = delegate
    }

    public func registerUser(name: String, email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                self.fireStoreManager.createUser(name: name, email: email) { error in
                    if error != nil {
                        self.delegate?.errorRegister(errorMessage: error?.localizedDescription ?? "")
                    } else {
                        self.delegate?.sucessRegister()
                    }
                }
            } else {
                self.delegate?.errorRegister(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
}



