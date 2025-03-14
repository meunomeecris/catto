
import SwiftUI

struct CattoPostList: View {
    @Environment(ModelData.self) var modelData

    var body: some View {
        @Bindable var modelData = modelData

        VStack {
            HStack {
                Text("Catto")
                    .heading()
                    .foregroundStyle(.textPrimaryLight)
                Spacer()
                MiauButtonProfile {
                    modelData.showingProfile.toggle()
                }
            }

            Spacer()

            VStack {
                ZStack {
                    if modelData.cattoPost.isEmpty {
                        ImageProgress()
                    } else {
                        ForEach(modelData.cattoPost) { catto in
                            CattoPost(cattoPost: modelData.getCattoBinding(for: catto))
                            Spacer()
                        }
                    }

                }
            }
            InputText()
                .padding(.bottom, 16)
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .background(.bgScreen)
        .sheet(isPresented: $modelData.showingProfile) {
            ProfileHost()
                .environment(modelData)
        }
        .alert("Meeeeeow", isPresented: .constant(modelData.isAlertPresented)) {
            Button("ok") {
                modelData.fetchCattoList()
            }
        } message: {
            Text("We’ve hit a cat-tastrophe! Try again later.")
        }
    }
}
