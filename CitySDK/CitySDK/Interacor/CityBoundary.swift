//
//  CityBoundary.swift
//  CitySDK
//
//  Created by Idris Sop on 2019/02/08.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

typealias FetchCitySuccessBlock = (_ responseModel: [CityResponseModel]?) -> Void
typealias FetchCityFailureBlock = (_ error: NSError) -> Void

protocol CityBoundary {

    func fetchCities(with success: @escaping FetchCitySuccessBlock,
                     failure: @escaping FetchCityFailureBlock)
}
