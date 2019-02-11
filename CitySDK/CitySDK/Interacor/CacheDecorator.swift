//
//  CacheDecorator.swift
//  CitySDK
//
//  Created by Idris Sop on 2019/02/08.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

class CacheDecorator: CityBoundary {

    //MARK: Retrieve all Cities from Cache or from API Endpoint
    func fetchCities(with success: @escaping FetchCitySuccessBlock,
                     failure: @escaping FetchCityFailureBlock) {
        if let cachedCities = CacheManager.sharedInstance.retrieveCachedCity() {
            success(cachedCities)
        } else {
            let cityInteractor = CityInteractor()
            cityInteractor.fetchCities(with: { (cityResponseModel) in
                CacheManager.sharedInstance.setCacheCity(cityResponseModel!)
                success(cityResponseModel)
            }) { (error) in
                failure(error)
            }
        }
    }
}
