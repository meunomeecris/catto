//
//  CatModel.swift
//  catto
//
//  Created by Cris Messias on 05/07/24.
//

import Foundation

struct CatModel: Codable, Hashable {
    let url: String
}

struct CaptionModel: Hashable {
    let user: String
    let vote: Int
    let caption: String
}

