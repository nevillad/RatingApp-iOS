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
    @Published var randomOrder:Bool = false {
        didSet (value) {
            if !value {
                self.startTimer()
            }else {
                self.stopTimer()
            }
        }
    }
    
    private var gameTimer: Timer?
    
    init(bookList: [Book]) {
        for book in bookList {
            let listItemViewModel = RAListItemViewModel(book: book)
            if !dataSource.contains(listItemViewModel) {
                self.dataSource.append(listItemViewModel)
            }
        }
    }
    
    func refresh() {
        dataSource.sort {
            $0.rating > $1.rating
        }
    }
    
    func startTimer() {
        gameTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(randomOrdering), userInfo: nil, repeats: true)
    }
    
    func stopTimer() {
        gameTimer?.invalidate()
    }
    
    @objc func randomOrdering() {
        let randomIndex = Int.random(in: 0..<self.dataSource.count)
        let randomRating = Float.random(in: 1...9)
        self.dataSource[randomIndex].rating = randomRating
        self.refresh()
    }
    
    func listItemViewModelAtIndex(index: Int) -> RAListItemViewModel {
        return self.dataSource[index]
    }
}
