//
//  URL+Extension.swift
//  APPMeuTreino
//
//  Created by Bruno Moura on 06/07/23.
//

import Foundation

extension URL {
    func queryStringComponents() -> [String: AnyObject] {
        var dict = [String: AnyObject]()
        if let query = self.query {
            for pair in query.components(separatedBy: "&") {
                let components = pair.components(separatedBy: "=")
                if (components.count > 1) {
                    dict[components[0]] = components[1] as AnyObject?
                }
            }
        }
        return dict
    }
}
