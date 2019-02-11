//
//  ShopViewModel.swift
//  EntersektAssessment
//
//  Created by Idris SOP on 2019/02/10.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit
import CitySDK

class ShopViewModel {

    //MARK: Private
    private var delegate: ShopViewModelDelegate?
    var shops: [ShopModel]?
    
    init(with delegate: ShopViewModelDelegate) {
        self.delegate = delegate
    }
    
    //MARK: Retrieve all Shops in a mall
    func retrieveAllShopsFromCitySDK(in selectedMallModel: MallModel,
                                     selectedCityMdel: CityModel) {
        let citySDKManager = CitySDKManager()
        citySDKManager.fetchAllShops(inMall: selectedMallModel.mallName ?? "",
                                     cityName: selectedCityMdel.cityName ?? "",
                                     success: { (shopsModel) in
            self.shops = shopsModel
            self.delegate?.updateViewContent()
        }) { (error) in
            self.delegate?.showErrorMessage(with: error.localizedDescription)
        }
    }
    
    //MARK: Retrieve all Shops in a city
    func retrieveAllShopsFromCitySDK(in cityName: String) {
        let citySDKManager = CitySDKManager()
        citySDKManager.fetchAllShops(inCity: cityName,
                                    success: { (shopsModel) in
            self.shops = shopsModel
            self.delegate?.updateViewContent()
        }) { (error) in
            self.delegate?.showErrorMessage(with: error.localizedDescription)
        }
    }
}
