//
//  ProductDetailViewModel.swift
//  SampleAppWithSwiftUI
//
//  Created by Okan Kocyigit on 20.08.2022.
//  
//

import Foundation

protocol ProductDetailViewModeling: ObservableObject {
    var pageTitle: String { get }
    var product: Product? { get }
    func viewDidLoad()
}

final class ProductDetailViewModel: ProductDetailViewModeling {
    private var dataStore: ProductDetailDataStore?
    private let router: ProductDetailRouting
    private let repository: ProductStorable

    var pageTitle = "Product Detail"
    var product: Product?

    init(router: ProductDetailRouting,
         dataStore: ProductDetailDataStore?,
         repository: ProductStorable) {
        self.router = router
        self.dataStore = dataStore
        self.repository = repository
    }

    func viewDidLoad() {
        guard let productId = dataStore?.id else {
            return
        }

        product = repository.getDetail(with: productId)
    }
}
