//
//  ProductListRouter.swift
//  SampleAppWithSwiftUI
//
//  Created by Okan Kocyigit on 20.08.2022.
//  
//

import UIKit

protocol ProductListRouting {
    func routeToProductDetail(with id: Int)
}

// MARK: - Wireframe

final class ProductListRouter: ProductListRouting {
    weak var viewController: UIViewController?
        
    // MARK: Routing logic
    func routeToProductDetail(with id: Int) {
        let dataStore = ProductDetailDataStore(id: id)
        let productDetail = ProductDetailBuilder.build(with: dataStore)
        viewController?.navigationController?.pushViewController(productDetail, animated: true)
    }
    
}
