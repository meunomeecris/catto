//
//  Profile.swift
//  Catto
//
//  Created by Cris Messias on 14/02/25.
//

import Swift

struct Profile {
    var username: String
    var imageUrl: String
    var catsName: String
    var catBreed: CatBreed
    var prefersNotifications:  Bool

    static let `default` = Profile(
        username: "Catto",
        imageUrl: "https://christchurchartgallery.org.nz/media/cache/47/33/473379428b70673f6137494dec0b2168.jpg",
        catsName: "Mosquito MiauMiauMiau",
        catBreed: .chartreux,
        prefersNotifications: true
        )


    enum CatBreed: String, CaseIterable, Identifiable {
        case persian = "Persian 🐱"
        case maineCoon = "Maine Coon 🦁"
        case siamese = "Siamese 🏜️"
        case bengal = "Bengal 🐆"
        case ragdoll = "Ragdoll 🧸"
        case sphynx = "Sphynx 🦴"
        case britishShorthair = "British Shorthair 🇬🇧"
        case scottishFold = "Scottish Fold 🎩"
        case abyssinian = "Abyssinian 🌅"
        case norwegianForest = "Norwegian Forest 🌲"
        case chartreux = "Chartreux 🇫🇷"

        var id: String { rawValue }
    }

}
