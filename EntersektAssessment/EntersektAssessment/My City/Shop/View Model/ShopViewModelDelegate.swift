//
//  ShopViewModelDelegate.swift
//  EntersektAssessment
//
//  Created by Idris SOP on 2019/02/10.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit

protocol ShopViewModelDelegate {
    
    //MARK: Delegate Functions
    func updateViewContent()
    func showErrorMessage(with message: String)
}
