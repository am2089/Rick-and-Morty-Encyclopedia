//
//  CharacterModel.swift
//  RickandMortyEncyclopedia
//
//  Created by Andrew Muniz on 10/28/22.
//

import Foundation

struct APIResponse: Codable {
    let results: [Characters]
}

struct Characters: Codable {
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
}

