//
//  HomeViewModelTests.swift
//  SystemTaskTests
//
//  Created by abdelrahman elabd on 21/03/2023.
//

import XCTest

class MovieListViewModelTests: XCTestCase {
    func testNumberOfMovies() {
        let viewModel = HomeViewModel() 
        XCTAssertEqual(viewModel.numberOfMovies, 3)
    }
    
    func testMovieAtIndex() {
        let viewModel = HomeViewModel()
        let movieViewModel = viewModel.movieAtIndex(0)
        XCTAssertEqual(movieViewModel.title, "The Godfather")
        XCTAssertEqual(movieViewModel.releaseYear, "1972")
    }
}
