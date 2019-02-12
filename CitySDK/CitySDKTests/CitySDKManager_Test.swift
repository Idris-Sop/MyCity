//
//  CitySDKManager_Test.swift
//  CitySDKTests
//
//  Created by Idris SOP on 2019/02/11.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import XCTest

class CitySDKManager_Test: XCTestCase {

    //MARK: Test to retrieve all the cities with success expectation
    func testFetchfetchAllCities() {
        let citySDKManager = CitySDKManager()
        let testExpectation = expectation(description: "success response expectation")
        citySDKManager.fetchAllCities(with: { (cityResponseModel) in
            testExpectation.fulfill()
            XCTAssert(cityResponseModel?.first?.cityName == "Cape Town")
        }) { (error) in
            XCTFail()
        }
        wait(for: [testExpectation], timeout: 5)
    }
    
    //MARK: Test to retrieve all the cities with empty data coming from CacheDecotor or Interactor
    func testFetchfetchAllCitiesWithEmptyData() {
        let citySDKManager = CitySDKManager()
        let testExpectation = expectation(description: "Failure response expectation")
        citySDKManager.fetchAllCities(with: { (cityResponseModel) in
            XCTFail()
        }) { (error) in
            testExpectation.fulfill()
            XCTAssert(error.domain == "The data couldn’t be read due to technical problem.")
        }
        wait(for: [testExpectation], timeout: 5)
    }

    //MARK: Test to retrieve all the Malls in city Johannesburg with with success expectation
    func testFetchAllMallsInACity() {
        let citySDKManager = CitySDKManager()
        let testExpectation = expectation(description: "success response expectation")
        citySDKManager.fetchAllMalls(inCity: "Johannesburg",success: { (mallResponseModel) in
            testExpectation.fulfill()
            XCTAssert(mallResponseModel?.first?.mallName == "Mall of Africa")
        }) { (error) in
            XCTFail()
        }
        wait(for: [testExpectation], timeout: 5)
    }
    
    //MARK: Test to retrieve all Shops in the Mall Gateway in Durban with success expectation
    func testFetchAllShopsInAMall() {
        let citySDKManager = CitySDKManager()
        let testExpectation = expectation(description: "success response expectation")
        citySDKManager.fetchAllShops(inMall: "Gateway", cityName: "Durban", success: { (shopResponseModel) in
            testExpectation.fulfill()
            XCTAssert(shopResponseModel?.count == 2)
        }) { (error) in
            XCTFail()
        }
        wait(for: [testExpectation], timeout: 5)
    }
    
    //MARK: Test to retrieve all Shops in the Mall Gateway in Johannesburg with expectation empty list
    func testFetchAllShopsInAMallAInADifferentCity() {
        let citySDKManager = CitySDKManager()
        let testExpectation = expectation(description: "Response with an empty array")
        citySDKManager.fetchAllShops(inMall: "Gateway", cityName: "Johannesburg", success: { (shopResponseModel) in
            testExpectation.fulfill()
            let shopList = [ShopModel]()
            XCTAssert(shopResponseModel == shopList)
        }) { (error) in
            XCTFail()
        }
        wait(for: [testExpectation], timeout: 5)
    }

    //MARK: Test to retrieve all the Shops in Johannesburg with success expectation
    func testFetchAllShopsInACity() {
        let citySDKManager = CitySDKManager()
        let testExpectation = expectation(description: "success response expectation")
        citySDKManager.fetchAllShops(inCity: "Johannesburg", success: { (shopResponseModel) in
            testExpectation.fulfill()
            XCTAssert(shopResponseModel?.count == 4)
        }) { (error) in
            XCTFail()
        }
        wait(for: [testExpectation], timeout: 5)
    }
}
