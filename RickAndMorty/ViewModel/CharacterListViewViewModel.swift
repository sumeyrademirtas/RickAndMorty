//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 22.08.2024.
//

import UIKit

import Foundation

struct CharacterListViewViewModel {
    func fetchCharacters() {
        Service.shared.execute(.listCharactersRequests, expecting: GetAllCharactersResponse.self) { result in
            switch result {
            case .success(let model):
                print("Example image url: "+String(model.results.first?.image ?? "No image"))
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
}


