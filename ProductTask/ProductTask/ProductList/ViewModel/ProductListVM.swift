//
//  ProductListVM.swift
//  ProductTask
//
//  Created by Rama krishna on 05/02/21.
//

import Foundation

class ProductListVM {
    var productList: Products?
    var loadProducts: (()->())?
    var networkLayer:Network?
    init() {
        networkLayer = Network.sharedInstance
    }
    
    func fetchInitialData(loadData: @escaping (()->())) {
        self.loadProducts = loadData
        getTheProductList()
    }
    
    func getTheProductList() {
        networkLayer?.getTheProductList { [weak self] data in
            self?.productList = data
            self?.loadProducts?()
        }
    }
}
