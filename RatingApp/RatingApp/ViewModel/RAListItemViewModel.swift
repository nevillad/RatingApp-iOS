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

class RAListItemViewModel: Identifiable, ObservableObject {
    private var book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    var id: String {
       return title + author
    }
     
    var title: String {
       guard let title = book.title else { return "" }
       return title
    }
     
    var author: String {
        guard let author = book.author else { return "" }
        return author
    }
    
    
    var bookDetailLine1: String {
        return String(format: "Author: %@, %d, Pages - %d", self.author , self.book.year ?? "N/A", self.book.pages ?? "N/A")
        
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

