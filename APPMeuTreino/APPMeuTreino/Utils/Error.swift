//
//  Error.swift
//  APPMeuTreino
//
//  Created by Douglas Stadulni on 07/07/23.
//

import Foundation

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case userNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorURLRequest(Swift.Error)
    case errorUrl(urlString: String)
    case errorDetail(detail: String)
}
