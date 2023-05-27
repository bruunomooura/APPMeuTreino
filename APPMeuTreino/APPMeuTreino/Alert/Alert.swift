//
//  Alert.swift
//  APPMeuTreino
//
//  Created by Bernardo Aguiar Guimarães on 17/05/23.
//

import UIKit

class Alert {
    private let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    public func alertInformation(title: String, message: String, completionHandler: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default) { _ in
            completionHandler?()
        }
        alertController.addAction(ok)
        controller.present(alertController, animated: true)
    }
}
