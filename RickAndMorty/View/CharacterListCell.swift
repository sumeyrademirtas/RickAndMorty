//
//  MainCellTableViewCell.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 19.08.2024.
//

import UIKit


class CharacterListCell: UITableViewCell {

    static let identifier = "CustomCell"
    
    private let viewModel = CharacterListViewViewModel()
    
    private let myImageView: UIImageView = {
       
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
        
    }()
    
    private let nameLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.text = "Error"
        return label
    }()
    
    private let statusLabel: UILabel = {
        
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "status"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
        viewModel.fetchCharacters()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupUI() {
        
        self.contentView.addSubview(myImageView)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(statusLabel)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
          
            myImageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            myImageView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            myImageView.widthAnchor.constraint(equalToConstant: 60),
            
            nameLabel.leadingAnchor.constraint(equalTo: self.myImageView.trailingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            nameLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            statusLabel.leadingAnchor.constraint(equalTo: self.myImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            statusLabel.topAnchor.constraint(equalToSystemSpacingBelow: self.contentView.topAnchor, multiplier: 6)
        ])

    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
        nameLabel.text = nil
        statusLabel.text = nil
    }
    
    
    public func configure(with viewModel: RMCharacterListCellViewModel){
        nameLabel.text = viewModel.characterName
        statusLabel.text = viewModel.characterStatusText
        viewModel.fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self?.myImageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
    
}
