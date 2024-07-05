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

   func GetAPIKey() -> String {
        guard let apiKey = Bundle.main.infoDictionary?["API_Key"] as? String else {
            print("API Key not found")
            return "API Key not found"
        }
        return apiKey
    }

    func getCat() async {
        let urlAPICat = "https://api.thecatapi.com/v1/images/search?api_key="
        
        guard let url = URL(string: "\(urlAPICat)\(GetAPIKey())") else {
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let catData = try JSONDecoder().decode([CatModel].self, from: data)
            if let cat = catData.first {
                DispatchQueue.main.async {
                    self.cat = cat
                }
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
