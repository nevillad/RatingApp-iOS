//
//  ListItemItemView.swift
//  RatingApp
//
//  Created by Nevil on 05/01/20.
//  Copyright © 2020 Nevil. All rights reserved.
//

import SwiftUI

struct RAListItemView: View {
    @ObservedObject private var viewModel: RAListItemViewModel
    @State private var isPresentingRatingView: Bool = false
    
    init(viewModel: RAListItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationLink(destination: RARatingView(viewModel: viewModel, isPresent: $isPresentingRatingView), isActive: self.$isPresentingRatingView) {
            HStack(alignment: .top) {
                ZStack(alignment: .topLeading) {
                    ZStack {
                        Image("BookSampleCover")
                            .resizable()
                            .renderingMode(.original)
                            .posterStyle(loaded: true, size: .medium
                        )
                            .animation(.easeInOut)
                    }
                }
                .fixedSize()
                VStack(alignment: .leading, spacing: 8) {
                    Text(viewModel.title)
                        .titleStyle()
                        .foregroundColor(.primary)
                        .lineLimit(2)
                    Text(viewModel.bookDetailLine1)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                        .truncationMode(.tail)
                    Text(viewModel.bookDetailLine2)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                    .truncationMode(.tail)
                    ZStack {
                        RARatingCircle(score: Int(viewModel.rating) * 10)
                    }.onTapGesture {
                        print("Pressed!")
                        self.isPresentingRatingView.toggle()
                    }
                }.padding(.leading, 8)
            }
            .transition(.identity)
        }
    }
}

struct ListItemItemView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            RAListItemView(viewModel: RAListItemViewModel(book: sampelBook))
        }
        
    }
}


