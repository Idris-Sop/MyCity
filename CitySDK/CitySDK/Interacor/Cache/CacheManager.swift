//
//  CacheManager.swift
//  CitySDK
//
//  Created by Idris Sop on 2019/02/08.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

class CacheManager {
    static let sharedInstance = CacheManager()
    private var cachedCityList: [CityModel]?
    
    func setCacheCity(_ cityToCache: [CityModel]) {
        cachedCityList = cityToCache
    }
    
    func retreiveCachedCity() -> [CityModel]? {
        return cachedCityList
    }
}
