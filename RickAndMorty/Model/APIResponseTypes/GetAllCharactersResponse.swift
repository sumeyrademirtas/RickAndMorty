//
//  GetCharactersResponse.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 21.08.2024.
//

import Foundation

struct GetAllCharactersResponse: Codable {
    
    let info: Info
    let results: [RMCharacter]
    
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    

}

    
