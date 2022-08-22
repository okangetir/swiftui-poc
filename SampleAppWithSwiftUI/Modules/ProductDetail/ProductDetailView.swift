//
//  ProductDetailView.swift
//  SampleAppWithSwiftUI
//
//  Created by Okan Kocyigit on 20.08.2022.
//  
//

import SwiftUI

struct ProductDetailView<ViewModel: ProductDetailViewModeling>: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        Text(viewModel.product?.name ?? "")
            .navigationTitle(viewModel.pageTitle)
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let dataStore = ProductDetailDataStore(id: 1)
        let router = ProductDetailRouter()
        let repository = MockProductStore()
        let viewModel = ProductDetailViewModel(router: router, dataStore: dataStore, repository: repository)
        ProductDetailView(viewModel: viewModel)
    }
}
