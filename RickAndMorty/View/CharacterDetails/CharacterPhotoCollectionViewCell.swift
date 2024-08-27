//
//  CharacterPhotoCollectionViewCell.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 27.08.2024.
//

import UIKit

final class CharacterPhotoCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CharacterPhotoCollectionViewCell"
    
        private let myImageView: UIImageView = {
            let iv = UIImageView()
            iv.contentMode = .scaleAspectFit
            iv.clipsToBounds = true
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(myImageView)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            myImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            myImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
    
    public func configure(with viewModel: CharacterPhotoCollectionViewCellViewModel) {
        viewModel.fetchImage { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.myImageView.image = UIImage(data: data)
                }
            case .failure:
                break
            }
        }
    }
}
