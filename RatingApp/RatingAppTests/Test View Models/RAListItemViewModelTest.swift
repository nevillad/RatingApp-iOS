//
//  RAListItemViewModelTest.swift
//  RatingAppTests
//
//  Created by Nevil on 11/01/20.
//  Copyright © 2020 Nevil. All rights reserved.
//

import XCTest

@testable import RatingApp
class RAListItemViewModelTest: XCTestCase {
    
    var sut: RAListItemViewModel!
    
    let dramaBook = Book(title: "Arthouse Drama", pages: 457, author: "Charles Dickens", country: "Germany", language: "German", year: 1971, rate: 7)
    
    override func setUp() {
        sut = RAListItemViewModel(book: dramaBook)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testID_CheckGenreration() {
        XCTAssertEqual(sut.id, "\("Arthouse Drama")\("Charles Dickens")")
    }
    
    
    func testBook_DetailsLine1_AuthorName_YearAndPages() {
        XCTAssertEqual(sut.bookDetailLine1, "Author: Charles Dickens, 1971, Pages - 457")
    }
    
    
    func testBook_DetailsLine2_Country_Language() {
        XCTAssertEqual(sut.bookDetailLine2, "Germany - German")
    }
    
}
