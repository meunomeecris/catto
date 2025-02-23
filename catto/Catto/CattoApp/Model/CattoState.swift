//
//  CattoState.swift
//  Catto
//
//  Created by Cris Messias on 21/02/25.
//

import Foundation
import SwiftUI

@Observable
class CattoState {
    var modelData: ModelData
    var showingProfile = false

    var filteredCatto: [Catto] {
        modelData.cattoPost.filter { post in
            post.isFavorite
        }
    }

    init(modelData: ModelData) {
        self.modelData = modelData
    }



}
