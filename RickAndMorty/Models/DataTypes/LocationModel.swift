//
//  LocationModel.swift
//  RickAndMorty
//
//  Created by Rendi Wijiatmoko on 27/12/22.
//

import Foundation

struct LocationModel: Codable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
}
