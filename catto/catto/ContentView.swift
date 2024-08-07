//
//  ContentView.swift
//  catto
//
//  Created by Cris Messias on 12/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CatView(viewModel: .constant(CatViewModel(catGetUserCase: CatUserCase())))
        }
    }
}

#Preview {
    ContentView()
}
