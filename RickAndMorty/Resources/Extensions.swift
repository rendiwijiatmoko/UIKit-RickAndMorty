//
//  Extensions.swift
//  RickAndMorty
//
//  Created by Rendi Wijiatmoko on 02/01/23.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
