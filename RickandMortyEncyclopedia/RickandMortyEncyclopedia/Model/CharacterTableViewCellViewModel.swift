//
//  CharacterTableViewCellViewModel.swift
//  RickandMortyEncyclopedia
//
//  Created by Andrew Muniz on 10/30/22.
//

import Foundation
class CharacterTableViewCellViewModel {
    
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String?
    let imageURL: URL?
    var imageData: Data? = nil
    
    init(
        name: String,
        status: String,
        species: String,
        gender: String,
        image: String?,
        imageURL: URL?
    ) {
        self.name = name
        self.status = status
        self.species = species
        self.gender = gender
        self.image = image
        self.imageURL = imageURL
    }
    
    
    
}
