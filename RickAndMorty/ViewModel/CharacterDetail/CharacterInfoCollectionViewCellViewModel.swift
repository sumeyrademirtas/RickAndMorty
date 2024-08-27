//
//  CharacterInfoCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 27.08.2024.
//

import Foundation

final class CharacterInfoCollectionViewCellViewModel {
    public let value: String
    public let title: String
    
    init(
        value: String,
         title: String
    ) {
        self.value = value
        self.title = title
    }
}
