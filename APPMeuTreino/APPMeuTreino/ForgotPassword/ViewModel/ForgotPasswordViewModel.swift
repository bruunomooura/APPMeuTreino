//
//  ForgotPasswordViewModel.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 27/05/23.
//

import UIKit
import Firebase

protocol ForgotPasswordViewModelProtocol: AnyObject {
    func successSendEmail()
    func errorSendEmail(errorMessage: String)
}

class ForgotPasswordViewModel {
    private weak var delegate: ForgotPasswordViewModelProtocol?
    public func delegate (delegate: ForgotPasswordViewModelProtocol?) {
        self.delegate = delegate
    }
    
    private var auth = Auth.auth()
    
    public func sendPasswordResetEmail(email: String) {
        auth.sendPasswordReset(withEmail: email) { error in
            if error == nil {
                self.delegate?.successSendEmail()
            } else {
                self.delegate?.errorSendEmail(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
}
