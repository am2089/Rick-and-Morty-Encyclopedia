//
//  CharacterTableViewCell.swift
//  RickandMortyEncyclopedia
//
//  Created by Andrew Muniz on 10/30/22.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    static let identifier = "CharacterTableViewCell"
    
    let characterNameLabel = CharacterNameLabel(textAlignhment: .left, fontSize: 20)
    let statusLabel = CharacterStatusLabel(textAlignhment: .left, fontSize: 14)
    let speciesLabel = CharacterSpeciesLabel(textAlignhment: .left, fontSize: 14)
    let genderLabel = CharacterGenderLabel(textAlignhment: .left, fontSize: 14)
    let characterImageView = CharacterImageView(frame: .zero)
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(characterNameLabel)
        contentView.addSubview(statusLabel)
        contentView.addSubview(speciesLabel)
        contentView.addSubview(genderLabel)
        contentView.addSubview(characterImageView)
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        characterNameLabel.frame = CGRect(x: 10, y: 0, width: contentView.frame.size.width-200, height: contentView.frame.size.height/2)
        statusLabel.frame = CGRect(x: 10, y: 30, width: contentView.frame.size.width-170, height: contentView.frame.size.height/2)
        speciesLabel.frame = CGRect(x: 10, y: 60, width: contentView.frame.size.width-170, height: contentView.frame.size.height/2)
        genderLabel.frame = CGRect(x: 10, y: 90, width: contentView.frame.size.width-170, height: contentView.frame.size.height/2)
        characterImageView.frame = CGRect(x: contentView.frame.size.width-170, y: 5, width: 160, height: contentView.frame.size.height - 10)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        characterNameLabel.text = nil
        statusLabel.text = nil
        speciesLabel.text = nil
        genderLabel.text = nil
        characterImageView.image = nil
    }
    
    func configure(with viewModel: CharacterTableViewCellViewModel ) {
        characterNameLabel.text = viewModel.name
        statusLabel.text = viewModel.status
        speciesLabel.text = viewModel.species
        genderLabel.text = viewModel.gender
        
        // Image
        if let data = viewModel.imageData {
            characterImageView.image = UIImage(data: data)
        }
        else if let url = viewModel.imageURL {
         // Fetch
            URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                viewModel.imageData = data
                DispatchQueue.main.async {
                    self?.characterImageView.image = UIImage(data: data)
                    
                }

            }.resume()
        }
    }

}
