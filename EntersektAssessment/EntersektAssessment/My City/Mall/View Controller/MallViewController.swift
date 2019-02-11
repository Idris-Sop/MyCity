//
//  MallViewController.swift
//  EntersektAssessment
//
//  Created by Idris SOP on 2019/02/10.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit
import CitySDK

class MallViewController: UIViewController {

    @IBOutlet private var mallTableView: UITableView!
    private var malls: [MallModel]?
    private var selectedCityModel: CityModel?
    private var selectedMallModel: MallModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: Register TableView Cell
        self.mallTableView.register(UINib(nibName: "MallTableViewCell", bundle: nil), forCellReuseIdentifier: "MallCellIdentifier")
    }
    
    func setMallList(with selectedCityModel: CityModel) {
        self.malls = selectedCityModel.mallList
        self.selectedCityModel = selectedCityModel
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShopSegueIdentifer" {
            let mallScreen = segue.destination as? ShopViewController
            mallScreen?.setShopList(with: self.selectedMallModel!,
                                    selectedCityMdel: self.selectedCityModel!)
        }
    }
}

extension MallViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return malls?.count ?? 0
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "MallCellIdentifier") as! MallTableViewCell
        tableViewCell.accessoryType = .disclosureIndicator
        tableViewCell.mallName?.text = malls?[indexPath.row].mallName
        tableViewCell.cityName?.text = self.selectedCityModel?.cityName
        return tableViewCell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedMallModel = malls![indexPath.row]
        performSegue(withIdentifier: "ShopSegueIdentifer", sender: self)
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

