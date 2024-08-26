//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 22.08.2024.
//

import UIKit

import Foundation


protocol CharacterListViewViewModelDelegate: NSObject {
    func didLoadInitialCharacters()
    func didSelectCharacter(_ character: RMCharacter)
    func rmCharacterListCell(_ cell: CharactersListVC, didSelectCharacter character: RMCharacter)

}

final class  CharacterListViewViewModel: NSObject {
    
    public weak var delegate: CharacterListViewViewModelDelegate?
    
    var didFetchCharacters: (() -> Void)? // Closure tanımlaması

    
    public var characters: [RMCharacter] = [] {
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
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }
                
            case .failure(let error):
                print(String(describing: error))
                print("API Call Failed: \(error.localizedDescription)")
            }
        }
    }
}




