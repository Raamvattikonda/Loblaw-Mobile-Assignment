//
//  ViewController.swift
//  ProductTask
//
//  Created by Rama krishna on 05/02/21.
//

import UIKit

class ProductListVC: UIViewController {
    var productVM = ProductListVM()
    var productNavigation: ProductNavigator?
    @IBOutlet weak var productColVw: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productNavigation = ProductNavigator(navigation: self.navigationController ?? UINavigationController())
        productColVw.register(ProductColVwCell.nib, forCellWithReuseIdentifier: ProductColVwCell.className)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadTheView()
    }
    
    func loadTheView() {
        productVM.fetchInitialData { [weak self] in
            if let strongSelf = self {
                strongSelf.productColVw.reloadData()
            }
        }
    }
}

extension ProductListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productVM.productList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductColVwCell.className, for: indexPath) as? ProductColVwCell
        cell?.product = productVM.productList?[indexPath.row]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - 40)
        return CGSize(width: width, height: width * 0.3)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        productNavigation?.moveToProductDetailVc(product: productVM.productList?[indexPath.row])
    }
}
