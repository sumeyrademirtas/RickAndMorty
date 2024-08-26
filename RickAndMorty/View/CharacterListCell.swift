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
        label.font = .systemFont(ofSize: 14, weight: .medium)
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
        
        let stack = UIStackView(arrangedSubviews: [nameLabel, statusLabel])
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        addSubview(stack)

        myImageView.translatesAutoresizingMaskIntoConstraints = false
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
          
            myImageView.topAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.bottomAnchor),
            myImageView.leadingAnchor.constraint(equalTo: self.contentView.layoutMarginsGuide.leadingAnchor),
            myImageView.widthAnchor.constraint(equalToConstant: 60),
            

            
            stack.leadingAnchor.constraint(equalTo: self.myImageView.trailingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            stack.topAnchor.constraint(equalToSystemSpacingBelow: self.contentView.topAnchor, multiplier: 2)        
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


