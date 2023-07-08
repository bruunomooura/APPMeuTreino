//
//  ChangePasswordViewModel.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 06/07/23.
//

import UIKit
import Firebase

protocol ChangePasswordViewModelProtocol: AnyObject {
    func changePassword(oldPassword: String, newPassword: String, completion: @escaping (Bool) -> Void)
}

class ChangePasswordViewModel: ChangePasswordViewModelProtocol {
    func changePassword(oldPassword: String, newPassword: String, completion: @escaping (Bool) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(false)
            return
        }
        
        let credential = EmailAuthProvider.credential(withEmail: user.email!, password: oldPassword)
        
        user.reauthenticate(with: credential) { (authResult, error) in
            if error != nil {
                completion(false)
                return
            }
            
            user.updatePassword(to: newPassword) { (error) in
                if let _ = error {
                    completion(false)
                } else {
                    completion(true)
                }
            }
        }
    }
}
