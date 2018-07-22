//
//  CoolBlueTests.swift
//  CoolBlueTests
//
//  Created by Mohamad Kaakati on 14/07/2018.
//  Copyright © 2018 Kaakati. All rights reserved.
//

import XCTest
@testable import CoolBlue

class CoolBlueTests: XCTestCase {
    
    var expectations : XCTestExpectation?
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.expectations = self.expectation(description: "Test was finished.")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSearchSuccess() {
        let query = "Apple"
        let paging = 1
        Product.search(query: query, page: paging) { (result) in
            switch result {
            case .success:
                XCTAssertTrue(true, "Success Fetch From API")
                self.expectations?.fulfill()
                break
            case .failure:
                break
            }
        }
        wait(for: [self.expectations!], timeout: 5)
    }
    
    func testProductDetails() {
        Product.details(forId: 785359) { (result) in
            switch result {
            case .success:
                XCTAssertTrue(true, "Success Fetch Details From API")
                self.expectations?.fulfill()
                break
            case .failure:
                break
            }
        }
        wait(for: [self.expectations!], timeout: 5)
    }
    

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
}
