//
//  WebServicesManagerInterface.swift
//  CitySDK
//
//  Created by Idris Sop on 2019/02/08.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

typealias WebServiceManagerSuccessBlock = (_ data: NSData) -> Void
typealias WebServiceManagerFailureBlock = (_ error: NSError) -> Void

protocol WebServicesManagerInterface {

    //MARK: Perform API Call Interface
    func performServerOperationWithURLRequest(with stringURL: String,
                                              bodyRequestParameter: [String: Any]?,
                                              httpMethod: String,
                                              success: @escaping WebServiceManagerSuccessBlock,
                                              failure: @escaping WebServiceManagerFailureBlock)
}
