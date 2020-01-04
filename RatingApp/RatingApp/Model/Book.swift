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
    let rate: Double?
}



