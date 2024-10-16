//
//  PostContestListUseCase.swift
//  Catto
//
//  Created by Cris Messias on 09/10/24.
//

import Foundation

@Observable
final class PostContestListUseCase {
    let apiError = APIError.self
    var postUseCase = PostUseCase()


    func fetchCats() async throws {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search?limit=22&breed_ids=beng&api_key=live_BYaJAKzpgJDw8juW988YkW2jRps8u9HoOHgYLLu1hzBOAPKKNNLiuG4xFC4vLRqI") else {
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

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

            let catData = try JSONDecoder().decode([CatImage].self, from: data)

            //Mapeia os `CatFeature` para `PostContestFeature`
            let postData = catData.map { cat in
                Post(cat: cat, caption: [])
            }
            //Atualiza o estado da view com os novos posts
            DispatchQueue.main.async {
                self.postUseCase.postList = postData
            }

        } catch {
            print("Error: \(error.localizedDescription)")
            throw apiError.invalidData
        }
    }
}
