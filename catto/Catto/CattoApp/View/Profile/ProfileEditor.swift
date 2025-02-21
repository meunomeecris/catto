//
//  ProfileEditor.swift
//  Catto
//
//  Created by Cris Messias on 14/02/25.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile

    var body: some View {
        List {
            HStack {
                Text("Username")
                Spacer()
                TextField("Username", text: $profile.username)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)
            }
            HStack {
                Text("Cats")
                Spacer()
                TextField("Cats", text: $profile.catsName)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.trailing)

            }
            Picker("Cat Breed", selection: $profile.catBreed) {
                ForEach(Profile.CatBreed.allCases) { catBreed in
                    Text(catBreed.rawValue).tag(catBreed)
                }
            }
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications")
            }
        }
    }
}

