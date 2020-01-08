//
//  RARatingView.swift
//  RatingApp
//
//  Created by Nevil on 05/01/20.
//  Copyright © 2020 Nevil. All rights reserved.
//

import SwiftUI

struct RARatingView: View {
    @ObservedObject var viewModel:RAListItemViewModel
    @Binding var isPresent: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                ZStack(alignment: .topLeading) {
                    ZStack {
                        Image("BookSampleCover")
                            .resizable()
                            .renderingMode(.original)
                            .posterStyle(loaded: true, size: .medium)
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
//                    ZStack {
//                        RARatingCircle(score: Int(viewModel.rating) * 10)
//                    }
                }.padding(.leading, 8)
            }.padding(10)
            HStack {
                Slider(value: self.$viewModel.rating, in: 1...10, step: 1)
                .accentColor(.blue)
                .padding(.all, 10)
                .background(Capsule().stroke(Color.blue, lineWidth: 1))

            }.padding(.bottom, 20)
                .padding(.top, 20)
            HStack {
                Spacer()
                Button(action: {
                    self.isPresent = false
                }) {
                    Text("Done").font(.title)
                        .fontWeight(.medium)
               }.buttonStyle(GradientBackgroundStyle())
                Spacer()
            }.padding(.all, 20)
            Spacer()
        }.padding(20)
    }
}

struct RARatingView_Previews: PreviewProvider {
    static var isPresentingRatingView: Bool = false
    static var previews: some View {

        RARatingView(viewModel: RAListItemViewModel(book: sampelBook), isPresent: .constant(true))
    }
}

struct GradientBackgroundStyle: ButtonStyle {

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: 200)
            .padding()
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(40)
            .padding(.horizontal, 5)
        .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}
