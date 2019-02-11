//
//  CacheManager.swift
//  CitySDK
//
//  Created by Idris Sop on 2019/02/08.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

class CacheManager {
    
    //MARK: Private variable
    static let sharedInstance = CacheManager()
    private var cachedCityList: [CityModel]?
    
    //MARK: Set Cities in the Cache
    func setCacheCity(_ cityToCache: [CityModel]) {
        cachedCityList = cityToCache
    }
    
    //MARK: Retrieve Cities from the cache
    func retrieveCachedCity() -> [CityModel]? {
        return cachedCityList
    }
}
