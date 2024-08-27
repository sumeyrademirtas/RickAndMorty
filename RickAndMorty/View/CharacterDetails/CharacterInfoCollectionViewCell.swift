//
//  CharacterInfoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 27.08.2024.
//

import UIKit

final class CharacterInfoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CharacterInfoCollectionViewCell"

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemTeal
        contentView.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    public func configure(with viewModel: CharacterInfoCollectionViewCellViewModel) {
        
    }
}
