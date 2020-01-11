//
//  Book.swift
//  RatingApp
//
//  Created by Nevil on 04/01/20.
//  Copyright © 2020 Nevil. All rights reserved.
//

import Foundation

struct Book: Codable, Equatable {
    let title: String
    let pages: Int
    let author: String
    let country: String?
    let language: String?
    let year: Int?
    var rate: Int?
    
    init(title:String, pages: Int, author: String, country: String? = nil, language: String? = nil, year: Int? = nil, rate: Int? = nil) {
        
        self.title = title
        self.pages = pages
        self.author = author
        self.country = country
        self.language = language
        self.year = year
        self.rate = rate
    }
}

func==(lhs: Book, rhs: Book) -> Bool {
    if lhs.title != rhs.title{
        return false
    }
    
    if lhs.year != rhs.year {
        return false
    }
    return true
}

let sampelBook = Book(title: "Real SwiftUI",pages: 77, author: "Nevil Lad", country: "India", language: "Swift", year: 2019, rate: 6)

