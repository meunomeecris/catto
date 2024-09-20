//
//  APIError.swift
//  catto
//
//  Created by Cris Messias on 20/09/24.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case tooManyRequests
    case internalServerError
    case badGateway
    case serviceUnavailable
    case gatewayTimeout
    case invalidData
    case unkown
}
