//
//  ProductStore.swift
//  SampleAppWithSwiftUI
//
//  Created by Okan Kocyigit on 20.08.2022.
//

import Foundation

protocol ProductStorable {
    func getAllProducts() -> [Product]
    func getDetail(with id: Int) -> Product
}

final class MockProductStore: ProductStorable {

    private var products = [
        Product(id: 1, name: "Cheese"),
        Product(id: 2, name: "Honey"),
        Product(id: 3, name: "Bread")
    ]

    func getAllProducts() -> [Product] {
        return products
    }

    func getDetail(with id: Int) -> Product {
        return products.first(where: { $0.id == id })!
    }
}
