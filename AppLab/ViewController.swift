//
//  ViewController.swift
//  AppLab
//
//  Created by Alejo Castaño on 19/07/2020.
//  Copyright © 2020 Alejo Castaño. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigation()
    }
    
    fileprivate func setupNavigation() {
        let leftBarButtonItem = UIBarButtonItem(title: "Movies", style: .plain, target: self, action: #selector(leftBarButtonItemTapped))
        
        let rightBarButtonItem = UIBarButtonItem(title: "List", style: .plain, target: self, action: #selector(rightBarButtonItemTapped))
        
        navigationItem.setLeftBarButton(leftBarButtonItem, animated: false)
        navigationItem.setRightBarButton(rightBarButtonItem, animated: false)
    }
    
    @objc fileprivate func leftBarButtonItemTapped() {
        self.navigationController?.pushViewController(HomeView(), animated: true)
    }
    
    @objc fileprivate func rightBarButtonItemTapped() {
        self.navigationController?.pushViewController(ListViewController(), animated: true)
    }
}
