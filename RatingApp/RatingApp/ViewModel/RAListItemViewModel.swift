//
//  ListItemViewModel.swift
//  RatingApp
//
//  Created by Nevil on 05/01/20.
//  Copyright © 2020 Nevil. All rights reserved.
//

import Foundation
class RAListItemViewModel: ObservableObject {
    private var book: Book
    init(book: Book) {
        self.book = book
    }
}
