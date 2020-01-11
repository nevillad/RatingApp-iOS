//
//  RAListViewModelTest.swift
//  RatingAppTests
//
//  Created by Nevil on 09/01/20.
//  Copyright © 2020 Nevil. All rights reserved.
//

import XCTest

@testable import RatingApp
class RAListViewModelTest: XCTestCase {
    var sut: RAListViewModel!
    
    let scifiBook = Book(title: "Sci-Fi", pages: 237, author: "Joseph Conrad", rate:  3)
    let dramaBook = Book(title: "Arthouse Drama", pages: 457, author: "Charles Dickens", rate: 7)
    let actionBook = Book(title: "Action/Adventure", pages: 767, author: "Denis Diderot",  rate: 6)
    
    override func setUp() {
        super.setUp()
        sut = RAListViewModel(bookList: [scifiBook, dramaBook, actionBook, scifiBook, actionBook])
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
   //MARK: Sort
    func testRefreshBooks_SortByRatingHighToLow(){
        sut.refresh()
        XCTAssertEqual(sut.dataSource[0], RAListItemViewModel(book: dramaBook))
        XCTAssertEqual(sut.dataSource[1], RAListItemViewModel(book: actionBook))
        XCTAssertEqual(sut.dataSource[2], RAListItemViewModel(book: scifiBook))
    }
    
    func testChangeBookRating_SortByRatingHighToLow() {
        sut.dataSource[2].rating = 8
        sut.refresh()
        XCTAssertEqual(sut.dataSource[0], RAListItemViewModel(book: scifiBook))
        XCTAssertEqual(sut.dataSource[1], RAListItemViewModel(book: dramaBook))
        XCTAssertEqual(sut.dataSource[2], RAListItemViewModel(book: actionBook))
    }

    // MARK: Duplicates
    func testDuplicateBooks_ShouldNotBeAddedToArray() {
        XCTAssertEqual(sut.dataSource.count, 3)
    }
    
    // MARK: Timer Test
    func testRandomOrder_ShouldStartTimerAndStopTimer() {
        sut.startTimer()
        sut.stopTimer()
    }
}

