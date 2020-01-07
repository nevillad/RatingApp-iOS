//
//  Book.swift
//  RatingApp
//
//  Created by Nevil on 04/01/20.
//  Copyright © 2020 Nevil. All rights reserved.
//

import Foundation

struct Book: Codable {
    let author, country, imageLink, language: String?
    let link: String?
    let pages: Int?
    let title: String?
    let year: Int?
    var rate: Int?
}


let sampelBook = Book(author: "Nevil Lad", country: "India", imageLink: "Real SwiftUI", language: "Swift", link: "", pages: 77, title: "Real SwiftUI", year: 2019, rate: 6)

