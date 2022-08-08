//
//  ViewController.swift
//  Devskiller
//
//  Created by VAMOSYS DRS on 06/08/22.
//  Copyright © 2022 Mindera. All rights reserved.

import UIKit


class LaunchViewController: UIViewController {
    
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView() {
        registerNib()
        newsAPI()
        newsTableView.backgroundColor = UIColor.clear
    }
    
    //MARK: - Register nib
    func registerNib() {
        newsTableView.register(NewsListTableViewCell.self)
    }
    
    //MARK: - News list API
    func newsAPI() {
        LoadingUtils.shared.showActivityIndicator(self.view)
        APIClient.shared.getNews() { (Success, error) in
            LoadingUtils.shared.hideActivityIndicator(self.view)
            if Success {
                self.displayData()
            } else if let error = error {
                self.alert(title: "Message", message: error.localizedDescription, cancel: "ok")
            }
        }
    }
    
    func displayData() {
        newsTableView.reloadData()
    }
}



