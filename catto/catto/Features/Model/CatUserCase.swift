//
//  CatUserCase.swift
//  catto
//
//  Created by Cris Messias on 05/07/24.
//

import Foundation

@Observable class CatUserCase {
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
        default: throw apiError.unkown
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











    //    func getCats() async {
    //
    //        let apiKey = "live_BYaJAKzpgJDw8juW988YkW2jRps8u9HoOHgYLLu1hzBOAPKKNNLiuG4xFC4vLRqI"
    //
    //        let urlAPICat = "https://api.thecatapi.com/v1/images/search?limit=11&breed_ids=beng&api_key=\(apiKey)"
    //
    //        //Cria um URL apartir da string fornecida ou encerra a função
    //        guard let urlRequest = URL(string: urlAPICat) else {
    //            print("Invalid URL")
    //            return
    //        }
    //
    //        //Bloco que pode lançar erros
    //        do {
    //            //Faz uma solicitação HTTP para baixar dados da URL
    //            let (data, _) = try await URLSession.shared.data(from: urlRequest)
    //            //Tenta decodificar os dados recevidos em um array de CatModel
    //            let catData = try JSONDecoder().decode([CatModel].self, from: data)
    //            //Verifica se existe um objeto CatModel e atualiza a thread para reflita na interface do usuário
    //                DispatchQueue.main.async {
    //                    self.cats = catData
    //                    print(self.cats.count)
    //                }
    //            //Capture qualquer erro do bloco
    //        } catch {
    //            print("Resquest error: \(error.localizedDescription)")
    //        }
    //    }




