//
//  CharacterDetailViewController.swift
//  RickAndMorty
//
//  Created by Rendi Wijiatmoko on 03/01/23.
//

import UIKit

/// Controller to show into about single character
final class CharacterDetailViewController: UIViewController {
    private let viewModel: CharacterDetailViewModel
    
    init(viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }
}
