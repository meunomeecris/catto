//
//  CatViewModel.swift
//  catto
//
//  Created by Cris Messias on 21/06/24.
//

import Foundation

@Observable
class CatViewModel {
    var catGetUserCase: CatUserCase
    var isAlertPresented: Bool

    init(catGetUserCase: CatUserCase, isAlertPresented: Bool = false) {
        self.catGetUserCase = catGetUserCase
        self.isAlertPresented = isAlertPresented
    }

    func onCatsViewAppear() {
        Task {
            do {
                try await catGetUserCase.getCats()
            } catch {
                print("Error occurred on getCats:\(error.localizedDescription)")
                isAlertPresented.toggle()
            }
        }
    }

    func profileButtonPressed() {
        
    }

    func sendButtonPressed() {
    }
}
