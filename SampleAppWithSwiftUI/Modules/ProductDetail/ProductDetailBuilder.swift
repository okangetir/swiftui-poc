//
//  ProductDetailBuilder.swift
//  SampleAppWithSwiftUI
//
//  Created by Okan Kocyigit on 20.08.2022.
//  
//

import UIKit

public struct ProductDetailDataStore {
    public let id: Int
}

public enum ProductDetailBuilder {
    public static func build(with dataStore: ProductDetailDataStore?) -> UIViewController {
        let router = ProductDetailRouter()
        let repository = MockProductStore()
        let viewModel = ProductDetailViewModel(router: router, dataStore: dataStore, repository: repository)
        let viewController = ProductDetailViewController(viewModel: viewModel)
        router.viewController = viewController
        return viewController
    }
}
