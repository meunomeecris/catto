//
//  ModelData.swift
//  Catto
//
//  Created by Cris Messias on 24/10/24.
//

import Foundation
import SwiftUI

@Observable
class ModelData {
    var cattoPost: [Catto] = load("cattoData.json")
    var profile = Profile.default
    var showingProfile = false

    var cattoIndices: [Int] {
        Array(cattoPost.indices)
    }

    var filteredCattoIndices: [Int] {
        cattoPost.indices.filter { index in
            cattoPost[index].isFavorite
        }
    }
    
    func getCattoBinding(at index: Int) -> Binding<Catto> {
        .init(
            get: { self.cattoPost[index] },
            set: { self.cattoPost[index] = $0 }
        )
    }

    func getCattoIndex(for catto: Catto) -> Int? {
        return cattoPost.firstIndex(where: { $0.id == catto.id })
    }

}


func load<T: Decodable>(_ filename: String) -> T {
    let data: Data


    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }


    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }


    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
