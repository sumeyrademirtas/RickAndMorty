//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 22.08.2024.
//

import UIKit

import Foundation

final class  CharacterListViewViewModel: NSObject {
    
    var didFetchCharacters: (() -> Void)? // Closure tanımlaması

    
    private var characters: [RMCharacter] = [] {
        didSet {
            for character in characters {
                let viewModel = RMCharacterListCellViewModel(
                    characterName: character.name,
                    characterStatus: character.status,
                    characterImageUrl: URL(string: character.image))
                cellViewModels.append(viewModel)
            } 
            didFetchCharacters?()
            
        }
    }
    
    public var cellViewModels: [RMCharacterListCellViewModel] = []
    
    public func fetchCharacters() {
        Service.shared.execute(.listCharactersRequests, 
                               expecting: GetAllCharactersResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let responseModel):
                print("API Call Success")
                let results = responseModel.results
                self?.characters = results
                
            case .failure(let error):
                print(String(describing: error))
                print("API Call Failed: \(error.localizedDescription)")
            }
        }
    }
}




