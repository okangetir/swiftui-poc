//
//  ProductCardView.swift
//  SampleAppWithSwiftUI
//
//  Created by Okan Kocyigit on 22.08.2022.
//

import SwiftUI

struct ProductCardView: View {
    private let viewModel: ProductCardViewModel

    init(viewModel: ProductCardViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        HStack {
            Text("\(viewModel.id)")
            Spacer()
            Text(viewModel.name)
        }
        .contentShape(Rectangle())
        .padding(40)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        let mockViewModel = ProductCardViewModel(id: 1,
                                                 name: "Cheese")
        ProductCardView(viewModel: mockViewModel)
            .previewLayout(.sizeThatFits)
    }
}
