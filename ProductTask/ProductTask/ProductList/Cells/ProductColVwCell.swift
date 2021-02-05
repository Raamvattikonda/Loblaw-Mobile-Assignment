//
//  ProductColVwCell.swift
//  ProductTask
//
//  Created by Rama krishna on 05/02/21.
//

import UIKit

class ProductColVwCell: UICollectionViewCell {
    @IBOutlet weak var thumbImage: UIImageView!
    
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var productName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    var product: Product? {
        didSet {
            self.productPrice.text = product?.price ?? ""
            self.productName.text = product?.name ?? ""
            self.thumbImage.loadTheImage(imageUrl: product?.image ?? "")
        }
    }
}
