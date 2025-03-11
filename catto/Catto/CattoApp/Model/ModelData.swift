//
//  ModelData.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import Foundation
import SwiftUI

@Observable @MainActor
class ModelData {
    let apiError = APIError.self
    var cattoPost: [Catto] = []
    var urlList: [catURL] = []
    var profile = Profile.default
    var showingProfile = false
    
    var filteredCattos: [Catto] {
        cattoPost.filter(\.isFavorite)
    }
    
    func getCattoBinding(for catto: Catto) -> Binding<Catto> {
        .init(
            get: {
                guard let index = self.getCattoIndex(for: catto) else { return catto }
                return self.cattoPost[index]
            },
            set: {
                guard let index = self.getCattoIndex(for: catto) else { return }
                self.cattoPost[index] = $0
            }
        )
    }

    func getCattoIndex(for catto: Catto) -> Int? {
        return cattoPost.firstIndex(where: { $0.id == catto.id })
    }

    func getURLCats() async throws {
        guard let urlRequest = URL(string: "https://api.thecatapi.com/v1/images/search?limit=22&breed_ids=beng&api_key=live_BYaJAKzpgJDw8juW988YkW2jRps8u9HoOHgYLLu1hzBOAPKKNNLiuG4xFC4vLRqI") else {
            return
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: urlRequest)

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

            let urlCatsData = try JSONDecoder().decode([catURL].self, from: data)

            let catto = urlCatsData.map { url in
                Catto(catImageUrl: url)
            }

            DispatchQueue.main.async {
                self.cattoPost = catto.reversed()
            }
        }
        catch {
            print("Error: \(error.localizedDescription)")
            throw  error
        }
    }

    func fetchCatto() {
        Task {
            do {
                try await getURLCats()
            } catch {
                print("Error occurred on fetchCats:\(error.localizedDescription)")
            }
        }
    }

}
