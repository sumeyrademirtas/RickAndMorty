//
//  CharacterDetailViewViewModel.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 26.08.2024.
//

import Foundation

final class CharacterDetailViewViewModel {
    
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var requestUrl: URL? {
        return URL(string: character.url)
    }
    
    public var title: String {
        character.name.uppercased()
    }
    
//    public func fetchCharacterData() {
//        guard let url = requestUrl,
//              let request = Request(url: url) else {
//            print("Failed to create")
//            return
//        }
//        
//        Service.shared.execute(request, expecting: RMCharacter.self) { result in
//            switch result {
//            case .success(let success):
//                print(String(describing: success))
//            case .failure(let failure):
//                print(String(describing: failure))
//            }
//        }
// 
//    }
}
