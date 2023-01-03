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
    private let pathComponents: [String]
    
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
    public init(endPoint: Endpoint, pathComponents: [String] = [], queryParameters: [URLQueryItem] = []) {
        self.endPoint = endPoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    convenience init?(url: URL) {
        let string = url.absoluteString
        if !string.contains(Constant.baseUrl) {
            return nil
        }
        let trimmed = string.replacingOccurrences(of: Constant.baseUrl+"/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0]
                if let RMEndpoint = Endpoint(rawValue: endpointString) {
                    self.init(endPoint: RMEndpoint)
                    return
                }
            }
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty {
                let endpointString = components[0]
                let queryItemString = components[1]
                
                let queryItems: [URLQueryItem] = queryItemString.components(separatedBy: "&").compactMap({
                    guard $0.contains("=") else {
                        return nil
                    }
                    
                    let parts = $0.components(separatedBy: "=")
                    
                    return URLQueryItem(name: parts[0], value: parts[1])
                })
                
                if let RMEndpoint = Endpoint(rawValue: endpointString) {
                    self.init(endPoint: RMEndpoint, queryParameters: queryItems)
                    return
                }
            }
        }
        
        return nil
    }
}


extension Request {
    static let listCharactersRequest = Request(endPoint: .character)
}
