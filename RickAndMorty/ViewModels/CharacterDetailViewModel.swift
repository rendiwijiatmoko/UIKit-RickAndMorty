//
//  CharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Rendi Wijiatmoko on 03/01/23.
//

import Foundation

final class CharacterDetailViewModel {
    private let character: CharacterModel
    init(character: CharacterModel) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
