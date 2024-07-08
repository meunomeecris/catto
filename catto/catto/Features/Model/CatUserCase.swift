//
//  CatUserCase.swift
//  catto
//
//  Created by Cris Messias on 05/07/24.
//

import Foundation

@MainActor
@Observable class CatUserCase {
    var cats: [CatModel] = []

    private func getAPIKey() -> String? {
        return Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    }

    func getCats() async {
        guard let apiKey = getAPIKey() else { fatalError("Missing URL") }

        let urlAPICat = "https://api.thecatapi.com/v1/images/search?limit=30&api_key=\(apiKey)"

        //Cria um URL apartir da string fornecida ou encerra a funcão
        guard let urlRequest = URL(string: urlAPICat) else {
            print("Invalid URL")
            return
        }

        //bloco que pode lançar (throw) erros
        do {
            //Faz uma solicitação HTTP para baixar dados da URL
            let (data, _) = try await URLSession.shared.data(from: urlRequest)
            //Tenta decodificar os dados recevidos em um array de CatModel
            let catData = try JSONDecoder().decode([CatModel].self, from: data)
            //Verifica se existe um objeto CatModel e atualiza a thread para reflita na interdace do usuário
                DispatchQueue.main.async {
                    self.cats = catData
                }
            //Capture qualquer erro do bloco
        } catch {
            print("Resquest error: \(error.localizedDescription)")
        }
    }
}




