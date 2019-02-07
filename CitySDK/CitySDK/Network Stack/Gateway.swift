//
//  Gateway.swift
//  CitySDK
//
//  Created by Idris SOP on 2019/02/07.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

typealias WebServiceManagerSuccessBlock = (_ success: NSData, _ responseCode: Int) -> Void
typealias WebServiceManagerFailureBlock = (_ error: NSError) -> Void

protocol Gateway {
    func performServerOperationWithURLRequest(with stringURL: String,
                                              bodyRequestParameter: [String: Any],
                                              httpMethod: String,
                                              success: @escaping WebServiceManagerSuccessBlock,
                                              failure: @escaping WebServiceManagerFailureBlock)
}
