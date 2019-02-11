//
//  CityInteractor.swift
//  CitySDK
//
//  Created by Idris Sop on 2019/02/08.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

class CityInteractor: CityBoundary {

    //MARK: Retrieve all Cities from API Endpoint
    func fetchCities(with success: @escaping FetchCitySuccessBlock,
                     failure: @escaping FetchCityFailureBlock) {
        let webServiceManager = WebServicesManager()
        webServiceManager.performServerOperationWithURLRequest(with: API_ENDPOINT,
                                                               bodyRequestParameter: nil,
                                                               httpMethod: "GET",
                                                               success: { (data) in
                                                                do {
                                                                    let jsonResponse = try JSONSerialization.jsonObject(with: data as Data, options: []) as! [String: Any]
                                                                    print(jsonResponse)
                                                                    var cityList = [CityModel]()
                                                                    if let cityArray = jsonResponse["cities"] as? Array<Any> {
                                                                        for (_, city) in ((cityArray).enumerated()) {
                                                                            let cityResponseModel = CityModel(dictionary: city as! [String : Any])
                                                                            cityList.append(cityResponseModel)
                                                                        }
                                                                    }
                                                                    success(cityList)
                                                                } catch  {
                                                                    failure(error as NSError)
                                                                }
        }) { (error) in
            failure(error)
        }
    }
}
