//
//  WebServicesManager.swift
//  CitySDK
//
//  Created by Idris SOP on 2019/02/07.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

class WebServicesManager: NSObject, Gateway {

//    static let sharedInstance = WebServicesManager()
    private var session = URLSession()
    
    override init(){
        super.init()
        let sessionConfiguration = URLSessionConfiguration.default
        let operationQueue = OperationQueue.main
//        sessionConfiguration.httpMaximumConnectionsPerHost = 1
//        sessionConfiguration.requestCachePolicy = .reloadIgnoringLocalCacheData
//        sessionConfiguration.timeoutIntervalForRequest = 30.0
//        sessionConfiguration.timeoutIntervalForResource = 30.0
        self.session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: operationQueue)
    }
    
    func performServerOperationWithURLRequest(with stringURL: String,
                                              bodyRequestParameter: [String: Any],
                                              httpMethod: String,
                                              success: @escaping WebServiceManagerSuccessBlock,
                                              failure: @escaping WebServiceManagerFailureBlock) {
        var requestURL = URLRequest(url: URL(string: stringURL)!)
        requestURL.httpMethod = httpMethod
        
        var dataTask = URLSessionDataTask()
        dataTask = session.dataTask(with: requestURL, completionHandler: { (data, response, error) in
            let httpResponse = response as? HTTPURLResponse
            let statusCode = httpResponse?.statusCode
            if (error != nil) {
                success(data! as NSData, statusCode!)
            } else {
                failure(error! as NSError)
            }
        })
        dataTask.resume()
    }
}

extension WebServicesManager: URLSessionDelegate {
    
}
