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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}

