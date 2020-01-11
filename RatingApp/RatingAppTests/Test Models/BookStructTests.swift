//
//  BookStructTests.swift
//  RatingAppTests
//
//  Created by Nevil on 09/01/20.
//  Copyright © 2020 Nevil. All rights reserved.
//

import XCTest

@testable import RatingApp

class BookStructTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: Initialization
    func testInit_BookWithTitle() {
        let testBook = Book(title: "Generic Bestseller", pages: 100, author: "Dante Alighieri")
        XCTAssertNotNil(testBook)
        XCTAssertEqual(testBook.title, "Generic Bestseller")
    }
    
    func testInit_SetBookTitleAndPages() {
        let testBook = Book(title: "Romantic Book", pages: 240, author: "Samuel Beckett")
        
        XCTAssertNotNil(testBook)
        XCTAssertEqual(testBook.pages, 240)
    }
    
    // MARK: Equatable
    func testEquatable_ReturnsTrue() {
        
        let nonFictionBook1 = Book(title: "Non-Fiction", pages: 230, author:  "Albert Camus")
        let nonFictionBook2 = Book(title: "Non-Fiction", pages: 230, author:  "Albert Camus")
        
        XCTAssertEqual(nonFictionBook1, nonFictionBook2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentTitles() {
        let book1 = Book(title: "Non-Fiction", pages: 230, author: "Albert Camus")
        let book2 = Book(title: "Fiction", pages: 230, author: "Paul Celan")
        
        XCTAssertNotEqual(book1, book2)
    }
    
    func testEquatable_ReturnsNotEqualForDifferentYears() {
        let book1 = Book(title: "Action,Fiction", pages: 230,  author: "Miguel de Cervantes", year: 2011)
        let book2 = Book(title: "Action,Fiction", pages: 230, author: "Miguel de Cervantes", year: 2018)
        
        XCTAssertNotEqual(book1, book2)
    }

}
