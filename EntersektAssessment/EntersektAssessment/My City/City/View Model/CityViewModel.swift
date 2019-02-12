//
//  CityViewModel.swift
//  EntersektAssessment
//
//  Created by Idris SOP on 2019/02/09.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit
import CitySDK

class CityViewModel {

    //MARK: Private
    private var delegate: CityViewModelDelegate?
    var cities: [CityModel]?
    
    init(with delegate: CityViewModelDelegate) {
        self.delegate = delegate
        retreiveCitiesFromCitySDK()
    }
    
    func retreiveCitiesFromCitySDK() {
        let citySDKManager = CitySDKManager()
        citySDKManager.fetchAllCities(with: { (citiesModel) in
            self.cities = citiesModel
            self.delegate?.updateViewContent()
        }) { (error) in
            self.delegate?.showErrorMessage(with: error.domain)
        }
    }
}
