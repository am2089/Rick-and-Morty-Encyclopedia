//
//  CharacterImageView.swift
//  RickandMortyEncyclopedia
//
//  Created by Andrew Muniz on 10/30/22.
//

import UIKit

class CharacterImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFill
    }
}
