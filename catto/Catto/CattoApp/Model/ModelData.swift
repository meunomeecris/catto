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
    var cattoPost: [Catto] = []
    var cattoPostReversed: [Catto] {
        cattoPost.reversed()
    }

    private var urlImageList: [catURL] = []
    private let apiError = APIError.self

    var showingProfile = false
    var profile = Profile.default

    var captionInput: String = ""
    var isAlertPresented: Bool = false

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

    func removeCattoFromList() {
        if !cattoPost.isEmpty {
            cattoPost.removeLast()
        }
    }

    // MARK: - InputText
    private func createAndAddCaption() {
        let countCaption: Int = cattoPost.last!.captionList.count

        let postCaution = cattoPost.count

        cattoPost[postCaution - 1].captionList.append(Catto.CattoCaption(
            id: countCaption + 1,
                user: Catto.CattoUser(
                    username: generateRandomNameUser(length: 5),
                    userImageUrl: "https://uploads.dailydot.com/2018/10/olli-the-polite-cat.jpg?q=65&auto=format&w=1600&ar=2:1&fit=crop"
                ),
                caption: captionInput,
                vote: 0,
                isMostVoted: false)
            )
            print("Caption created!")
    }

    func addCaptionButtonPressed() {
        createAndAddCaption()
        captionInput = ""
    }

    ///--Mockup names
    func generateRandomNameUser(length: Int) -> String {
        let consonants = "bcdfghjklmnpqrstvwxyz"
        let vowels = "aeiou"
        var name = ""
        var isVowel = Bool.random()

        for _ in 0..<length {
            if isVowel {
                name += String(vowels.randomElement()!)
            } else {
                name += String(consonants.randomElement()!)
            }
            isVowel.toggle()
        }
        return name.capitalized
    }

    //MARK: - FETCH AND CREAT CATTOS
    func getURLCats() async throws {
        guard let urlRequest = URL(string: "https://api.thecatapi.com/v1/images/search?limit=22&breed_ids=beng&api_key=live_BYaJAKzpgJDw8juW988YkW2jRps8u9HoOHgYLLu1hzBOAPKKNNLiuG4xFC4vLRqI") else {
            isAlertPresented.toggle()
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
                self.cattoPost = catto
            }
        }
        catch {
            throw error
        }
    }

    func fetchCattoList() {
        Task {
            do {
                try await getURLCats()
            } catch {
                print("Error occurred on fetchCats:\(error.localizedDescription)")
                isAlertPresented.toggle()
            }
        }
    }

}



