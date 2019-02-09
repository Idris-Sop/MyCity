//
//  CityViewController.swift
//  EntersektAssessment
//
//  Created by Idris SOP on 2019/02/09.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit
import CitySDK

class CityViewController: UIViewController, CityViewModelDelegate {
    
    @IBOutlet private var cityTableView: UITableView!
    private lazy var viewModel = CityViewModel(with: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.isNavigationBarHidden = false
        self.cityTableView.register(UITableViewCell.self, forCellReuseIdentifier: "CityCellIdentifier")
    }
    
    //MARK: CityViewModelDelegate
    func updateViewContent() {
        self.cityTableView.reloadData()
    }
}

extension CityViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cities?.count ?? 0
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "CityCellIdentifier")
        tableViewCell?.accessoryType = .disclosureIndicator
        let cityModel = viewModel.cities![indexPath.row]
        tableViewCell?.textLabel?.text = cityModel.cityName
        return tableViewCell!
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityModel = viewModel.cities![indexPath.row]
        print(cityModel.mallList!)
    }
}
