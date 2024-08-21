//
//  Service.swift
//  RickAndMorty
//
//  Created by Sümeyra Demirtaş on 21.08.2024.
//

import Foundation


/// Primary API service object to get Rick and Morty data
final class Service {
    
    /// Shared singleton instance
    static let shared = Service()
    
    
    /// Privatized constructor
    private init() {
        
        
        /// Send Rick and Morty API Call
        /// - Parameters:
        ///   - request: Request instance
        ///   - completion: Callback with data or error
        public func execute(_ request: Request, completion: @escaping () -> Void) {
            
        }
    }
}
