//
//  ContentView.swift
//  RatingApp
//
//  Created by Nevil on 04/01/20.
//  Copyright © 2020 Nevil. All rights reserved.
//

import SwiftUI

struct RAListView: View {
    @ObservedObject var viewModel: ListViewModel
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
    
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView()
//    }
//}
