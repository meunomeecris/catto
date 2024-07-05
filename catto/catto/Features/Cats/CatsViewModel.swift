//
//  CatsViewModel.swift
//  catto
//
//  Created by Cris Messias on 21/06/24.
//

import Foundation
import SwiftUI

@Observable
class CatsViewModel {
    var catGetUserCase: CatUserCase
    var catImage: UIImage? = nil

    init(catGetUserCase: CatUserCase) {
        self.catGetUserCase = catGetUserCase
    }

    @MainActor 
    func loadImage() {
        guard let urlString = catGetUserCase.cat?.url, let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data else { return }

            DispatchQueue.main.async {
                self.catImage = UIImage(data: imageData)
            }
        }
        .resume()
    }

    func onCatsViewAppear() {
        Task {
            await catGetUserCase.getCat()
            await loadImage()
        }
    }

    func profileButtonPressed() {

    }

    func sendButtonPressed() {
    }
}
