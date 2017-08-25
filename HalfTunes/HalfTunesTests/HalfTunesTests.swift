//
//  HalfTunesTests.swift
//  HalfTunesTests
//
//  Created by 蔡祥霖 on 2017/7/27.
//  Copyright © 2017年 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import HalfTunes
class HalfTunesTests: XCTestCase {
    var sessionUnderTest: URLSession!
    override func setUp() {
        super.setUp()
		sessionUnderTest = URLSession(configuration: URLSessionConfiguration.default)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		 sessionUnderTest = nil
        super.tearDown()
    }
    
	func testValidCallToiTunesGetsHTTPStatusCode200() {
		  // given
		  let url = URL(string: "https://itunes.apple.com/search?media=music&entity=song&term=abba")
		  // 1
		  let promise = expectation(description: "Status code: 200")
		  var statusCode: Int?
		  var responseError: Error?
		  // when
		  let dataTask = sessionUnderTest.dataTask(with: url!) { data, response, error in
			statusCode = (response as? HTTPURLResponse)?.statusCode
			responseError = error
			// 2
			promise.fulfill()
		  }
		  dataTask.resume()
		  // 3
		  waitForExpectations(timeout: 5, handler: nil)
		// then
  		 XCTAssertNil(responseError)
  		 XCTAssertEqual(statusCode, 200)
	}
	
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
