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
    var captionInput: String

    init(catGetUserCase: CatUserCase, isAlertPresented: Bool = false, captionInput: String = "") {
        self.catGetUserCase = catGetUserCase
        self.isAlertPresented = isAlertPresented
        self.captionInput = captionInput
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

    func sendButtonPressed() {
        captionInput = ""
    }

    func profileButtonPressed() {

    }
}
