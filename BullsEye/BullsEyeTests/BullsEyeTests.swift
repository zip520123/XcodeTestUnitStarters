//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by 蔡祥霖 on 2017/7/26.
//  Copyright © 2017年 Ray Wenderlich. All rights reserved.
//

import XCTest
@testable import BullsEye
class BullsEyeTests: XCTestCase {
    var gameUnderTest: BullsEyeGame!
    override func setUp() {
        super.setUp()
		gameUnderTest = BullsEyeGame()
		gameUnderTest.startNewGame()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		gameUnderTest = nil
        super.tearDown()
    }
	// XCTAssert to test model
	func testScoreIsComputedWhenGuessGTTarget() {
	  // 1. given
	  let guess = gameUnderTest.targetValue + 5
	  
	  // 2. when
	  _ = gameUnderTest.check(guess: guess)
	  
	  // 3. then
	  XCTAssertEqual(gameUnderTest.scoreRound, 95, "Score computed from guess is wrong")
	}
	func testScoreIsComputedWhenGuessLTTarget() {
	  // 1. given
	  let guess = gameUnderTest.targetValue - 5
	  
	  // 2. when
	  _ = gameUnderTest.check(guess: guess)
	  
	  // 3. then
	  XCTAssertEqual(gameUnderTest.scoreRound, 95, "Score computed from guess is wrong")
	}
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
	
	
    
}
