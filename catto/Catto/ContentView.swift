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
            PostContestListView(viewModel: PostContestListViewModel(postUseCase: PostContestListUseCase()))
        }
    }
}

#Preview {
    ContentView()
}
