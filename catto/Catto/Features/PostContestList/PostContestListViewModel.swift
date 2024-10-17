//
//  PostContestListViewModel.swift
//  Catto
//
//  Created by Cris Messias on 09/10/24.
//

import Foundation

@Observable
class PostContestListViewModel {
    var getContestList: PostContestListUseCase
    var isAlertPresented: Bool = false


    init(getContestList: PostContestListUseCase) {
        self.getContestList = getContestList
    }

    func onViewAppearGetCats() {
        Task {
            do {
                try await getContestList.fetchCats()
            } catch {
                print("Error occurred on fetchCats:\(error.localizedDescription)")
                isAlertPresented.toggle()
            }
        }
    }

    var contestList: [Post] {
        getContestList.postUseCase.postList.reversed()
    }

    func profileButtonPressed() {

    }
}
