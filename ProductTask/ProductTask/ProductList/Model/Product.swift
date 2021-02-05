//
//  Product.swift
//  ProductTask
//
//  Created by Rama krishna on 05/02/21.
//

import Foundation

struct Product: Codable {
    let id, name: String
    let image: String
    let price, type: String
}

typealias Products = [Product]
