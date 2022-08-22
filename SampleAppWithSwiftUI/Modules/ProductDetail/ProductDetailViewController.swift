//
//  ProductDetailViewController.swift
//  SampleAppWithSwiftUI
//
//  Created by Okan Kocyigit on 20.08.2022.
//  
//

import SwiftUI

/*
 We can also create our UIHostingController to override UIViewController lifecyle methods.
 */

final class ProductDetailViewController<ViewModel: ProductDetailViewModeling>: UIHostingController<ProductDetailView<ViewModel>> {
    @ObservedObject var viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(rootView: ProductDetailView(viewModel: viewModel))
    }

    @MainActor dynamic required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
}
