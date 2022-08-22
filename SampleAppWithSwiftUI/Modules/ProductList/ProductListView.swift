//
//  ProductListView.swift
//  SampleAppWithSwiftUI
//
//  Created by Okan Kocyigit on 20.08.2022.
//  
//

import SwiftUI

struct ProductListView<ViewModel: ProductListViewModeling>: View {
    @ObservedObject var viewModel: ViewModel

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        viewModel.viewDidLoad()
    }

    var body: some View {
        productList
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.addNewProduct()
                } label: {
                    Image(systemName: "plus")
                }
            }
            ToolbarItem(placement: .principal) {
                Button {
                    viewModel.addNewProduct()
                } label: {
                    VStack {
                        Image(systemName: "macpro.gen3.server")
                        Text(viewModel.pageTitle)
                    }
                }

            }
        })
    }

    var productList: some View {
        ScrollView {
            ForEach(viewModel.products, id: \.self) { product in
                ProductCardView(viewModel: .init(id: product.id,
                                                 name: product.name))
                .padding(10)
                .onTapGesture {
                    viewModel.showProductDetail(with: product.id)
                }
                Spacer()

            }
            .onDelete { indexSet in

            }
            .listStyle(.plain)
            .listRowInsets(EdgeInsets())
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        let dataStore = ProductListDataStore()
        let router = ProductListRouter()
        let repository = MockProductStore()
        let viewModel = ProductListViewModel(router: router, dataStore: dataStore, repository: repository)
        ProductListView(viewModel: viewModel)
    }
}
