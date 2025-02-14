//
//  ContentView.swift
//  catto
//
//  Created by Cris Messias on 12/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .post

    enum Tab {
        case post
        case favorite
        case mvvm
    }

    var body: some View {
        TabView {
            CattoPostList()
                .tabItem {
                    Label("Catto", systemImage: "cat.circle")
                }
                .tag(Tab.post)

            FavoriteList()
                .tabItem {
                    Label("Favorite", systemImage: "heart.circle")
                }
                .tag(Tab.favorite)

            SplashScreen()
                .tabItem {
                    Label("MVVM", systemImage: "graduationcap.circle")
                }
                .tag(Tab.mvvm)
        }
    }
}
