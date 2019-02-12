//
//  CityInteractor_Test.swift
//  CitySDKTests
//
//  Created by Idris SOP on 2019/02/11.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import XCTest

class CityInteractor_Test: XCTestCase {

    //MARK: Test to retrieve all the cities with success expectation
    func testFetchCities() {
        let interactor = CityInteractor()
        let testExpectation = expectation(description: "success response expectation")
        interactor.fetchCities(with: { (cityResponseModel) in
            testExpectation.fulfill()
            XCTAssert(cityResponseModel?.first?.cityName == "Cape Town")
        }) { (error) in
            XCTFail()
        }
        wait(for: [testExpectation], timeout: 5)
    }
    
    //MARK: Test to retrieve all the cities with empty data coming from WebServiceManager
    func testFetchCitiesWithEmptyData() {
        let interactor = CityInteractor()
        let testExpectation = expectation(description: "Failure response expectation")
        interactor.fetchCities(with: { (cityResponseModel) in
            XCTFail()
        }) { (error) in
            testExpectation.fulfill()
            XCTAssert(error.domain == "The data couldn’t be read due to technical problem.")
        }
        wait(for: [testExpectation], timeout: 5)
    }
    
    //MARK: Test to retrieve all the cities with empty response coming from WebServiceManager (When no internet connection)
    func testFetchCitiesWithEmptyResponse() {
        let interactor = CityInteractor()
        let testExpectation = expectation(description: "Failure response expectation")
        interactor.fetchCities(with: { (cityResponseModel) in
            XCTFail()
        }) { (error) in
            testExpectation.fulfill()
            XCTAssert(error.localizedDescription == "The Internet connection appears to be offline.")
        }
        wait(for: [testExpectation], timeout: 5)
    }
}
