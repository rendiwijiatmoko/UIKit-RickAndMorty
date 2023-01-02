//
//  Request.swift
//  RickAndMorty
//
//  Created by Rendi Wijiatmoko on 27/12/22.
//

import Foundation

/// Object that represents single API call
final class Request {
    /// API Constant
    private struct Constant {
        static let baseUrl = "https://rickandmortyapi.com/api"
    }
    
    /// Desired component
    private let endPoint: Endpoint
    
    /// Path components for API, if any
    private let pathComponents: Set<String>
    
    /// Query arguments for API, if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for the api request in string format
    private var urlString: String {
        var string = Constant.baseUrl
        string += "/"
        string += endPoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach ({
                string += "/\($0)"
            })
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            
            let argumentString = queryParameters.compactMap({
                guard let value = $0.value else {return nil}
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed and constructed API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    /// Desired HTTP Method
    public let httpMethod = "GET"
    
    // MARK: - Public
    
    /// Consturct request
    /// - Parameters:
    ///   - endPoint: Target endpoint
    ///   - pathComponents: Collections of path components
    ///   - queryParameters: Collections of query paramaters
    public init(endPoint: Endpoint, pathComponents: Set<String> = [], queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
}
