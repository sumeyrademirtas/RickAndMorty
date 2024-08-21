//
//  EndPoint.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 21.08.2024.
//

import Foundation


/// Represents unique API endpoint
@frozen enum EndPoint: String {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
