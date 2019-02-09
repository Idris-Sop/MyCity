//
//  MallModel.swift
//  CitySDK
//
//  Created by Idris SOP on 2019/02/08.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

public class MallModel: NSObject {

    public private(set) var cityId: Int?
    public private(set) var mallId: Int?
    public private(set) var mallName: String?
    public private(set) var shopList: [ShopModel]?
    
    init(dictionary: [String: Any]) {
        if let mallId = dictionary["id"] {
            self.mallId = mallId as? Int
        }
        
        if let mallName = dictionary["name"] {
            self.mallName = mallName as? String
        }
        
        self.shopList = [ShopModel]()
        if let shopArray = dictionary["shops"] as? Array<Any> {
            for (_, shop) in ((shopArray).enumerated()) {
                let shopModel = ShopModel(dictionary: shop as! [String : Any])
                self.shopList?.append(shopModel)
            }
        }
    }
}
