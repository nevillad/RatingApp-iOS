//
//  ListItemViewModel.swift
//  RatingApp
//
//  Created by Nevil on 05/01/20.
//  Copyright © 2020 Nevil. All rights reserved.
//

import Foundation
import SwiftUI
import MapKit

class RAListItemViewModel: Identifiable, ObservableObject, Equatable {
    private var book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var id: String {
        return title + author
    }
     
    var title: String {
       return book.title
    }
     
    var author: String {
        return book.author
    }
    
    var bookDetailLine1: String {
        return String(format: "Author: %@, %d, Pages - %d", self.author , self.book.year ?? "N/A", self.book.pages)
    }
    
    var bookDetailLine2: String {
        return String(format: "%@ - %@", self.book.country ?? "N/A", self.book.language ?? "N/A")
    }
    
    var rating: Float {
        get {
            guard let rating = book.rate else { return 0.0 }
            return Float(rating)
        }
        set(value) {
            self.book.rate = Int(value)
        }
    }
}

func == (lhs: RAListItemViewModel, rhs: RAListItemViewModel) -> Bool {
    if lhs.id != rhs.id{
         return false
     }
    return true
}

