//
//  ShopModel.swift
//  CitySDK
//
//  Created by Idris SOP on 2019/02/08.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

public class ShopModel: NSObject {

    public private(set) var cityId: Int?
    public private(set) var mallName: String?
    public private(set) var shopId: Int?
    public private(set) var shopName: String?
    
    init(dictionary: [String: Any],
         mallName: String) {
        self.mallName = mallName
        if let shopId = dictionary["id"] {
            self.shopId = shopId as? Int
        }
        
        if let shopName = dictionary["name"] {
            self.shopName = shopName as? String
        }
    }
}
