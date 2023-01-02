//
//  EpisodeModel.swift
//  RickAndMorty
//
//  Created by Rendi Wijiatmoko on 27/12/22.
//

import Foundation

struct EpisodeModel: Codable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
    let url: String
    let created: String
}
