//
//  CattoTests.swift
//  CattoTests
//
//  Created by Cris Messias on 28/02/2u5.
//

import Testing
@testable import Catto

struct CattoTests {

    @Test("Find Catto index")
    func getCattoIndex() async throws {
        let modelData = ModelData()
        let catto = [
            Catto(id: 101, catImageUrl: "", isFavorite: true, captionList: []),
            Catto(id: 102, catImageUrl: "", isFavorite: true, captionList: []),
            Catto(id: 103, catImageUrl: "", isFavorite: true, captionList: [])
        ]
        let currentCatto = catto[2]
        let index = modelData.getCattoIndex(for: currentCatto)
        #expect(index == 2)
    }

    @Test("Return a list of favorite catto")
    func favoriteCattoList() async throws {
        let modelData = ModelData()
        let catto = [
            Catto(id: 101, catImageUrl: "", isFavorite: true, captionList: []),
            Catto(id: 102, catImageUrl: "", isFavorite: true, captionList: []),
            Catto(id: 103, catImageUrl: "", isFavorite: false, captionList: []),
            Catto(id: 104, catImageUrl: "", isFavorite: true, captionList: []),
            Catto(id: 105, catImageUrl: "", isFavorite: false, captionList: []),
        ]
        
        modelData.cattoPost = catto

        let filtered = modelData.filteredCattos

        let countFiltered = filtered.count

        #expect(countFiltered == 3)
    }
}
