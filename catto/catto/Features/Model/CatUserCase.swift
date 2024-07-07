//
//  CatUserCase.swift
//  catto
//
//  Created by Cris Messias on 05/07/24.
//

import Foundation

@MainActor
class CatUserCase {
    var cat: CatModel?

    func getAPIKey() -> String? {
        return Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    }

    func getCat() async {
        guard let apiKey = getAPIKey() else {
            print("API key is missing")
            return
        }

        let urlAPICat = "https://api.thecatapi.com/v1/images/search?api_key=\(apiKey)"

        //Cria um URL apartir da string fornecida ou encerra a funcão
        guard let url = URL(string: urlAPICat) else {
            print("Invalid URL")
            return
        }

        //bloco que pode lançar (throw) erros
        do {
            //Faz uma solicitação HTTP para baixar dados da URL
            let (data, _) = try await URLSession.shared.data(from: url)
            //Tenta decodificar os dados recevidos em um array de CatModel
            let catData = try JSONDecoder().decode([CatModel].self, from: data)
            //Verifica se existe um objeto CatModel e atualiza a thread para reflita na interdace do usuário
            if let cat = catData.first {
                DispatchQueue.main.async {
                    self.cat = cat
                }
            }
            //Capture qualquer erro do bloco
        } catch {
            print("Cathed error: \(error.localizedDescription)")
        }
    }
}
