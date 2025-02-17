//
//  ProfileSummary.swift
//  Catto
//
//  Created by Cris Messias on 14/02/25.
//

import SwiftUI

struct ProfileSummary: View {
    @Environment(ModelData.self) var modelData
    var profile: Profile

    var body: some View {
        VStack {
            VStack {
                AvatarUser(imageUrl: profile.imageUrl)
                    .frame(width: 120, height: 120)
                Text(profile.username)
                    .bold()
                    .font(.title)
            }
            .padding(.top, 40)

            Divider()

            VStack(alignment: .leading, spacing: 12) {
                Text("Cats: \(profile.catsName)")
                    .font(.title3)
                Text("Cat Breed: \(profile.catBreed.rawValue)")
                    .font(.title3)
                Text("Notifications: \(profile.prefersNotifications ? "on" : "off")")
                    .font(.title3)

            }

            .padding(.top, 12)

            Spacer()

            Link("By me a salad 🥗 ?",destination: URL(string: "https://www.patreon.com/en-GB")!)
                .foregroundStyle(.bgScreen)
                .padding([.horizontal ], 16)
                .frame(height: 48)
                .background(.bgCardPrimary)
                .clipShape(RoundedRectangle(cornerRadius: 16))

            Text(" © meunomeecris - v 1.0")
                .font(.caption)
                .padding(.top, 12)
        }
        .padding([.horizontal], 16)
    }
}

