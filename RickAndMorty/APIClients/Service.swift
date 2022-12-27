//
//  Service.swift
//  RickAndMorty
//
//  Created by Rendi Wijiatmoko on 27/12/22.
//

import Foundation

/// Primary API Service object to get Rick And Morty data
final class Service {
    /// shared singleton instance
    static let shared = Service()
    
    
    /// Privatized constructor
    private init() {}
    
    /// Send Rick And Morty API Call
    /// - Parameters:
    ///   - request: Request instance
    ///   - completion: callback with data or error
    public func execute(_ request: Request, completion: @escaping () -> Void) {
        
    }
}
