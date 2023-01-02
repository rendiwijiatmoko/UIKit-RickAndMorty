//
//  CharacterViewController.swift
//  RickAndMorty
//
//  Created by Rendi Wijiatmoko on 27/12/22.
//

import UIKit

/// Controller to show and search for Characters
final class CharacterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Characters"
        
        Service.shared.execute(.listCharactersRequest, expecting: GetAllCharactersResponse.self) { result in
            switch result {
            case .success(let success):
                print(String(describing: success))
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
}
