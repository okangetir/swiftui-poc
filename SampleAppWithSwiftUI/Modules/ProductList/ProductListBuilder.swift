//
//  ProductListBuilder.swift
//  SampleAppWithSwiftUI
//
//  Created by Okan Kocyigit on 20.08.2022.
//  
//

import UIKit
import SwiftUI

public struct ProductListDataStore {
    public init() {
        // waiting development
    }
}

public enum ProductListBuilder {
    public static func build(with dataStore: ProductListDataStore?) -> UIViewController {
        let router = ProductListRouter()
        let repository = MockProductStore()
        let viewModel = ProductListViewModel(router: router, dataStore: dataStore, repository: repository)
        let view = ProductListView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        router.viewController = viewController
        return viewController
    }
}
