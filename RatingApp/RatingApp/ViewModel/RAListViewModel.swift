//
//  ListViewModel.swift
//  RatingApp
//
//  Created by Nevil on 04/01/20.
//  Copyright © 2020 Nevil. All rights reserved.
//

import Foundation
import Combine

class RAListViewModel: ObservableObject {
    var bookList:[Book]
    
    init(bookList: [Book]) {
        self.bookList = bookList
    }
}
