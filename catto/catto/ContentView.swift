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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.auxiliarBrand)
            Text("Hello, world!")
                .foregroundStyle(.textPrimary)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
