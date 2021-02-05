//
//  ProductNavigation.swift
//  ProductTask
//
//  Created by Rama krishna on 05/02/21.
//

import Foundation
import UIKit

class ProductNavigator {
    var navigationController: UINavigationController?
    init(navigation: UINavigationController) {
        self.navigationController = navigation
    }
    
    func moveToProductDetailVc(product: Product?) {
        let stryBrd = UIStoryboard(name: "Main", bundle: nil)
        let vc = stryBrd.instantiateViewController(withIdentifier: ProductDetailsVC.className) as? ProductDetailsVC
        vc?.product = product
        vc?.modalPresentationStyle = .overFullScreen
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

