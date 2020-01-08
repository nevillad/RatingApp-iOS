//
//  ContentView.swift
//  RatingApp
//
//  Created by Nevil on 04/01/20.
//  Copyright © 2020 Nevil. All rights reserved.
//

import SwiftUI

struct RAListView: View {
    @ObservedObject var viewModel: RAListViewModel

    init(viewModel: RAListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Toggle(isOn: self.$viewModel.randomOrder, label: {Text("Random Order")})
                }.padding(.all, 20)
                    
                List {
                    ForEach(self.viewModel.dataSource, content: RAListItemView.init(viewModel:))
                }.onAppear(perform: viewModel.refresh )
            }
            .navigationBarTitle(Text("Books Rating"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RAListView(viewModel: RAListViewModel(bookList: [sampelBook]))
    }
}
