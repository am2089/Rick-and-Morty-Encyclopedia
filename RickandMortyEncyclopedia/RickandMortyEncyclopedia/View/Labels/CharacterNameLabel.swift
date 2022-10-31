//
//  RMNameLabel.swift
//  RickandMortyEncyclopedia
//
//  Created by Andrew Muniz on 10/30/22.
//

import UIKit

class CharacterNameLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignhment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignhment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        configure()
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        numberOfLines = 0
        lineBreakMode = .byCharWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
