//
//  CityTest.swift
//  CitySDK
//
//  Created by Idris SOP on 2019/02/07.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

public class CityTest: NSObject {

    public func fetchAllCities() {
        let cityCacheDecorator = CacheDecorator()
        cityCacheDecorator.fetchCities(with: { (cityResponseModel) in
            print(cityResponseModel!)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
