//
//  ArticleRepositoryTests.swift
//  NY AppTests
//
//  Created by Syed Bilal on 04/08/2024.
//

import XCTest
@testable import NY_App

final class ArticleRepositoryTests: XCTestCase {

    var repository = ArticleRepository()

    
    override class func setUp() {
        super.setUp()
        
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        super.tearDown()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchAllSectionWeekArticles() {
        let expectation = self.expectation(description: "FetchMostPopularArticles")

        repository.getArticles(section: .AllSections, period: .Week) { status, response, error in
            switch status {
            case .SUCCESS:
                if let response = response, response.status == STATUS_OK {
                    XCTAssertNotNil(response.results, "No articles were fetched.")
                    XCTAssertGreaterThan(response.results?.count ?? 0, 0, "No articles were fetched.")
                } else {
                    XCTFail("Error fetching articles (Status Code): \(response?.status ?? "404")")
                }
                break
            case .ERROR, .FAILED:
                XCTFail("Error fetching articles: \(error?.localizedDescription ?? ERROR_MESSAGE)")
            }

            expectation.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
