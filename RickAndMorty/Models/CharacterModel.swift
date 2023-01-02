//
//  CharacterModel.swift
//  RickAndMorty
//
//  Created by Rendi Wijiatmoko on 27/12/22.
//

import Foundation

struct CharacterModel: Codable {
    let id: Int
    let name: String
    let status: CharacterStatus
    let species: String
    let type: String
    let gender: CharacterGender
    let origin: OriginModel
    let location: SingleLocationModel
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

enum CharacterStatus: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case `unknown` = "unknown"
}

enum CharacterGender: String, Codable {
    case male = "Male"
    case female = "Felmale"
    case Genderless = "Genderless"
    case `unknown` = "unknown"
}
