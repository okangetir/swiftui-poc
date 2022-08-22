//
//  ProductListViewModel.swift
//  SampleAppWithSwiftUI
//
//  Created by Okan Kocyigit on 20.08.2022.
//  
//

import Foundation

protocol ProductListViewModeling: ObservableObject {
    var pageTitle: String { get }
    var products: [Product] { get }
    func viewDidLoad()
    func showProductDetail(with id: Int)
    func addNewProduct()
}

final class ProductListViewModel: ProductListViewModeling {
    private var dataStore: ProductListDataStore?
    private let router: ProductListRouting
    private let repository: ProductStorable

    @Published var pageTitle = ""
    @Published var products: [Product] = []

    init(router: ProductListRouting,
         dataStore: ProductListDataStore?,
         repository: ProductStorable) {
        self.router = router
        self.dataStore = dataStore
        self.repository = repository
    }

    func viewDidLoad() {
        pageTitle = "All Products"
        products = repository.getAllProducts()
    }

    func showProductDetail(with id: Int) {
        router.routeToProductDetail(with: id)
    }

    func addNewProduct() {
        products += products
    }
}
