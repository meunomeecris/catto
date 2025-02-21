//
//  CattoState.swift
//  Catto
//
//  Created by Cris Messias on 21/02/25.
//

import Foundation

@Observable
class CattoState {
    var modelData: ModelData
    var currentID: Int = 0

    init(modelData: ModelData) {
        self.modelData = modelData
    }
}
