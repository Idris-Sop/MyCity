//
//  CityTest.swift
//  CitySDK
//
//  Created by Idris SOP on 2019/02/07.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

public class CityTest: NSObject {

    public func testServiceCall() {
        let webServiceManager = WebServicesManager()
        webServiceManager.performServerOperationWithURLRequest(with: "http://www.mocky.io/v2/5b7e8bc03000005c0084c210",
                                                               bodyRequestParameter: [String:Any](),
                                                               httpMethod: "GET",
                                                               success: { (data, responseCode) in
                                                                do {
                                                                    let jsonResponse = try JSONSerialization.jsonObject(with: data as Data, options: []) as! [String: Any]
                                                                    print(jsonResponse)
                                                                } catch  {
                                                                    print(error.localizedDescription)
                                                                }
                                                                
        }) { (error) in
            print(error.localizedDescription)
        }
    }
}
