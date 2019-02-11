//
//  ShopViewController.swift
//  EntersektAssessment
//
//  Created by Idris SOP on 2019/02/10.
//  Copyright © 2019 Idris SOP. All rights reserved.
//

import UIKit
import CitySDK

class ShopViewController: UIViewController, ShopViewModelDelegate {

    @IBOutlet var shopTableView: UITableView!
    private var shops: [ShopModel]?
    private var selectedMallModel: MallModel?
    private var selectedCityModel: CityModel?
    
    lazy private var viewModel = ShopViewModel(with: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //MARK: Add Navigation Bar button
        let viewShopsBarButton = UIBarButtonItem(title: "View All Shops in City", style: .plain, target: self, action: #selector(barButtonTapped))
        navigationItem.rightBarButtonItems = [viewShopsBarButton]
        
        //MARK: Register TableView Cell
        self.shopTableView.register(UINib(nibName: "ShopTableViewCell", bundle: nil), forCellReuseIdentifier: "ShopCellIdentifier")
        viewModel.retrieveAllShopsFromCitySDK(in: selectedMallModel!,
                                              selectedCityMdel: selectedCityModel!)
    }
    
    //MARK: BarButtonItem Touch Listener
    @objc func barButtonTapped() {
        viewModel.retrieveAllShopsFromCitySDK(in: self.selectedCityModel?.cityName ?? "")
    }
    
    func setShopList(with selectedMallModel: MallModel,
                     selectedCityMdel: CityModel) {
        self.shops = selectedMallModel.shopList
        self.selectedMallModel = selectedMallModel
        self.selectedCityModel = selectedCityMdel
    }
    
    // MARK: ShopViewModelDelegate
    func updateViewContent() {
        self.shops = viewModel.shops
        self.shopTableView.reloadData()
    }
    
    // MARK: ShopViewModelDelegate
    func showErrorMessage(with message: String) {
        let alertViewController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertViewController.addAction(actionButton)
        self.present(alertViewController, animated: true, completion: nil)
    }
}

extension ShopViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shops?.count ?? 0
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "ShopCellIdentifier") as! ShopTableViewCell
        tableViewCell.shopNameLabel?.text = shops?[indexPath.row].shopName
        tableViewCell.mallNameLabel?.text = shops?[indexPath.row].mallName
        tableViewCell.cityNameLabel?.text = self.selectedCityModel?.cityName
        return tableViewCell
    }
    
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

