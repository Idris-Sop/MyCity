//
//  WebServicesManager.swift
//  CitySDK
//
//  Created by Idris SOP on 2019/02/07.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

class WebServicesManager: NSObject, WebServicesManagerInterface {

    //MARK: Perform API Call
    func performServerOperationWithURLRequest(with stringURL: String,
                                              bodyRequestParameter: [String: Any]?,
                                              httpMethod: String,
                                              success: @escaping WebServiceManagerSuccessBlock,
                                              failure: @escaping WebServiceManagerFailureBlock) {
        var requestURL = URLRequest(url: URL(string: stringURL)!)
        requestURL.httpMethod = httpMethod
        
        //MARK: Set Body Request Parameter
        if let dict = bodyRequestParameter {
            if let bodyData = try? JSONSerialization.data(withJSONObject: dict) {
                requestURL.httpBody = bodyData
                requestURL.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
                requestURL.setValue("application/json", forHTTPHeaderField: "Accept")
            }
        }

        let gateway = Gateway()
        gateway.executeServerCommunicationWithURLRequest(with: requestURL) { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                if statusCode == 200 {
                    success(data!)
                } else {
                    failure(error!)
                }
            } else {
                failure(error!)
            }
        }
    }
}
