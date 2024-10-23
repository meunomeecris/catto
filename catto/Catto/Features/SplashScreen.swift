//
//  SplashScreen.swift
//  Catto
//
//  Created by Cris Messias on 19/10/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var showSplashScreen: Bool = true
    @State private var showInfos: Bool = false
    @State private var size = 0.2
    @State private var opacity = 0.5

    var body: some View {
        ZStack {
            Color.auxiliarBrand
                .ignoresSafeArea()
            if showSplashScreen {
                VStack {
                    Image(.splashAvatar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.auxiliarCardCatBoard, lineWidth: 8))
                        .shadow(radius: 12)
                        .scaleEffect(size)
                        .opacity(opacity)

                    VStack() {
                        Text("Catto")
                            .font(.custom("InknutAntiqua-Medium", size: 40))
                            .bold()
                        Text("Prurr-crastinate Time!")
                            .font(.custom("InknutAntiqua-Medium", size: 20))
                            .multilineTextAlignment(.center)
                            .lineSpacing(5)
                    }
                    .foregroundStyle(.textPrimaryDark)
                    .opacity(showInfos ? 1 : 0)
                    .animation(.easeIn(duration: 0.2), value: showInfos)
                }
            } else {
                PostContestListView(viewModel: PostContestListViewModel(getContestList: PostContestListUseCase()))
            }
        }
        .onAppear() {
            withAnimation(.easeIn(duration: 0.8)) {
                self.size = 1.0
                self.opacity = 1.0
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                withAnimation {
                    showInfos  = true
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.6) {
                withAnimation(.smooth) {
                    showSplashScreen = false
                }
            }
        }
    }
}
