//
//  CatUserCase.swift
//  catto
//
//  Created by Cris Messias on 05/07/24.
//

import Foundation


class CatUserCase {
    let apiError = APIError.self

    func getCats() async throws -> [CatModel] {
        //API endpoint and apikey
        let urlApiCat = "https://api.thecatapi.com/v1/images/search?limit=11&breed_ids=beng&api_key=live_BYaJAKzpgJDw8juW988YkW2jRps8u9HoOHgYLLu1hzBOAPKKNNLiuG4xFC4vLRqI"

        //Creating the URL from the endpoint
        guard let urlRequest = URL(string: urlApiCat) else { throw apiError.invalidURL }

        //Getting data and response from the URL
        let (data, response) = try await URLSession.shared.data(from: urlRequest)

        //Handling error
        guard let response = response as? HTTPURLResponse else {
            throw apiError.invalidResponse
        }
        switch response.statusCode {
        case 200: break
        case 400: throw apiError.badRequest
        case 401: throw apiError.unauthorized
        case 403: throw apiError.forbidden
        case 404: throw apiError.notFound
        case 429: throw apiError.tooManyRequests
        case 500: throw apiError.internalServerError
        case 502: throw apiError.badGateway
        case 503: throw apiError.serviceUnavailable
        case 504: throw apiError.gatewayTimeout
        default: throw apiError.unknown
        }

        //Convert the JSON to Swift Data
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([CatModel].self, from: data)
        } catch {
            throw apiError.invalidData
        }
    }
}
