//  cattoApp.swift
//  catto
//
//  Created by Cris Messias on 12/06/24.
//

import SwiftUI
import Foundation

@main
struct CattoApp: App {
    @State private var modelData = ModelData()
    @State private var cattoState: CattoState

    init() {
        let md = ModelData()
        self.cattoState = CattoState(modelData: md)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
                .environment(cattoState)
        }
    }
}

