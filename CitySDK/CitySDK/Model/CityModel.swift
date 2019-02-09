//
//  CityModel.swift
//  CitySDK
//
//  Created by Idris Sop on 2019/02/08.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

public class CityModel: NSObject {

    public private(set) var cityId: Int?
    public private(set) var cityName: String?
    public private(set) var mallList: [MallModel]?
    
    init(dictionary: [String: Any]) {
        if let cityId = dictionary["id"] {
            self.cityId = cityId as? Int
        }
        
        if let cityName = dictionary["name"] {
            self.cityName = cityName as? String
        }
        
        self.mallList = [MallModel]()
        if let mallArray = dictionary["malls"] as? Array<Any> {
            for (_, mall) in ((mallArray).enumerated()) {
                let mallModel = MallModel(dictionary: mall as! [String : Any])
                self.mallList?.append(mallModel)
            }
        }
    }
}
