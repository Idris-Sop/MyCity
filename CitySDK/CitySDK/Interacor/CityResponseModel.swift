//
//  CityResponseModel.swift
//  CitySDK
//
//  Created by Idris Sop on 2019/02/08.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

class CityResponseModel: NSObject {

    private(set) var cityId: Int?
    private(set) var cityName: String?
    
    init(dictionary: [String: Any]) {
        if let cityId = dictionary["id"] {
            self.cityId = cityId as? Int
        }
        
        if let cityName = dictionary["name"] {
            self.cityName = cityName as? String
        }
    }
}
