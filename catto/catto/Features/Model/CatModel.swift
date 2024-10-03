//
//  CatModel.swift
//  catto
//
//  Created by Cris Messias on 05/07/24.
//

import Foundation

struct CatModel: Codable, Identifiable, Hashable {
    let id: String
    let url: String
}
