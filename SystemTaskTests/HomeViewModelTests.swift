//
//  HomeViewModelTests.swift
//  SystemTaskTests
//
//  Created by abdelrahman elabd on 21/03/2023.
//

import XCTest

@testable import SystemTask


class MovieListViewModelTests: XCTestCase {
    
    func testNumberOfRepos() {
        let viewModel = HomeViewModel()
        XCTAssertEqual(viewModel.numberOfRepos, 0)
        viewModel.fetchRepos {
            XCTAssertEqual(viewModel.numberOfRepos, 30)
        }
    }
    
    func testRepoAtIndex() {
        let viewModel = HomeViewModel()
        viewModel.fetchRepos {
            let movieViewModel = viewModel.repoAtIndex(0)
            XCTAssertEqual(movieViewModel.name, "Name")
        }
        

    }
}
