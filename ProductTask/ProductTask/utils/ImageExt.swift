//
//  ImageExt.swift
//  ProductTask
//
//  Created by Rama krishna on 05/02/21.
//

import Foundation
import UIKit
import Nuke

extension UIImageView {
    func loadTheImage(imageUrl: String) {
        let url = URL(string: imageUrl)!
        let options = ImageLoadingOptions(
            placeholder: nil,
            transition: .fadeIn(duration: 0.33)
        )
        Nuke.loadImage(with: url, options: options, into: self)
    }
}
