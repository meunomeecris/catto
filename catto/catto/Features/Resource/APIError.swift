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
    case unknown

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided is invalid."
        case .invalidResponse:
            return "The server response was invalid."
        case .badRequest:
            return "Bad request. Please check the request and try again."
        case .unauthorized:
            return "Unauthorized access. Please check your credentials."
        case .forbidden:
            return "Access to this resource is forbidden."
        case .notFound:
            return "The requested resource was not found."
        case .tooManyRequests:
            return "You have made too many requests. Please try again later."
        case .internalServerError:
            return "The server encountered an internal error."
        case .badGateway:
            return "The server received an invalid response from the upstream server."
        case .serviceUnavailable:
            return "The service is currently unavailable. Please try again later."
        case .gatewayTimeout:
            return "The server timed out while waiting for a response from the upstream server."
        case .invalidData:
            return "The data received from the server was invalid."
        case .unknown:
            return "An unknown error occurred."
        }
    }
}
