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
    @Published var dataSource: [RAListItemViewModel] = []
    
    init(bookList: [Book]) {
        for book in bookList {
            self.dataSource.append(RAListItemViewModel(book: book))
        }
    }
    
    func refresh() {
        dataSource.sort {
            $0.rating > $1.rating
        }
    }
    
    func randomOrdering() {
        
    }
}
