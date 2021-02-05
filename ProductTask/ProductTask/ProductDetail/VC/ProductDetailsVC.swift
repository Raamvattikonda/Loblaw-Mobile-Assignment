//
//  ProductDetailsVC.swift
//  ProductTask
//
//  Created by Rama krishna on 05/02/21.
//

import UIKit

class ProductDetailsVC: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productImage.loadTheImage(imageUrl: product?.image ?? "")
        // Do any additional setup after loading the view.
    }
}

extension ProductDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: ProductTblVwCell.className, for: indexPath) as? ProductTblVwCell
        cell?.lblProductName.text = product?.name ?? ""
        cell?.lblProductPrice.text = product?.price ?? ""
        return cell!
    }
}
