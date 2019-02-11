//
//  CitySDKManager.swift
//  CitySDK
//
//  Created by Idris SOP on 2019/02/07.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

public class CitySDKManager: NSObject {

    //MARK: Retrieve all cities 
    public func fetchAllCities(with success: @escaping ([CityModel]?) -> (),
                               failure: @escaping (NSError) -> ()) {
        let cityCacheDecorator = CacheDecorator()
        cityCacheDecorator.fetchCities(with: { (cityResponseModel) in
            success(cityResponseModel)
        }) { (error) in
            failure(error)
        }
    }
    
    //MARK: Retrieve all Malls in a city
    public func fetchAllMalls(inCity cityName: String,
                              success: @escaping ([MallModel]?) -> (),
                              failure: @escaping (NSError) -> ()) {
        let cityCacheDecorator = CacheDecorator()
        cityCacheDecorator.fetchCities(with: { (cityResponseModel) in
            var mallList = [MallModel]()
            for(_, city) in (((cityResponseModel)?.enumerated())!) {
                if city.cityName == cityName {
                    mallList = city.mallList!
                }
            }
            success(mallList)
        }) { (error) in
            failure(error)
        }
    }
    
    //MARK: Retrieve all Shops in a mall
    public func fetchAllShops(inMall mallName: String,
                              cityName: String,
                              success: @escaping ([ShopModel]?) -> (),
                              failure: @escaping (NSError) -> ()) {
        let cityCacheDecorator = CacheDecorator()
        cityCacheDecorator.fetchCities(with: { (cityResponseModel) in
            var shopList = [ShopModel]()
            for(_, city) in (((cityResponseModel)?.enumerated())!) {
                if city.cityName == cityName {
                    for(_, mall) in (((city.mallList)?.enumerated())!) {
                        if mall.mallName == mallName {
                            shopList = mall.shopList!
                        }
                    }
                }
            }
            success(shopList)
        }) { (error) in
            failure(error)
        }
    }
    
    //MARK: Retrieve all Shops in a city
    public func fetchAllShops(inCity cityName: String,
                              success: @escaping ([ShopModel]?) -> (),
                              failure: @escaping (NSError) -> ()) {
        let cityCacheDecorator = CacheDecorator()
        cityCacheDecorator.fetchCities(with: { (cityResponseModel) in
            var shopList = [ShopModel]()
            for(_, city) in (((cityResponseModel)?.enumerated())!) {
                if city.cityName == cityName {
                    for(_, mall) in (((city.mallList)?.enumerated())!) {
                        for(_, shop) in (((mall.shopList)?.enumerated())!) {
                            shopList.append(shop)
                        }
                    }
                }
            }
            success(shopList)
        }) { (error) in
            failure(error)
        }
    }
}

