//
//  DataManagerTest.swift
//  FitBod-CodingSample-SadieContiniTests
//
//  Created by sadie on 12/31/17.
//  Copyright © 2017 sadiecontini. All rights reserved.
//

import XCTest
@testable import FitBod_CodingSample_SadieContini

class DataManagerTest: XCTestCase, DataManagerDelegate {
    
    var manager = DataManager.shared
    var loadDataExpectation: XCTestExpectation!
    var testDataFileName = "workoutDataTest"
    
    override func setUp() {
        super.setUp()
        manager.delegate = self
        manager.exercises = [Exercise]()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadData() {
        loadDataExpectation = XCTestExpectation(description: "load data")
        manager.loadData(fileName: testDataFileName)
        wait(for: [loadDataExpectation], timeout: 10)
    }
    
    func completeTestLoadData() {
        let exercises = manager.exercises
        XCTAssert(exercises.count == 3, "exercises count should be 3 but is: \(exercises.count)")
        
        // Back Squats in test
        XCTAssert(exercises[0].workouts.count == 3, "\(exercises[0].name) workout count should be 3 but is: \(exercises[0].workouts.count)")
        XCTAssert(exercises[0].workouts[0].sets.count == 7, "\(exercises[0].name) workout count should be 3 but is: \(exercises[0].workouts.count)")
        
        loadDataExpectation.fulfill()
    }
    
    func didLoadData() {
        completeTestLoadData()
    }
}

