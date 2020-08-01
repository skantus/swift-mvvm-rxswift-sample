//
//  ViewController.swift
//  AppLab
//
//  Created by Alejo Castaño on 19/07/2020.
//  Copyright © 2020 Alejo Castaño. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigation()
        setupViews()
    }
    
    fileprivate func setupNavigation() {
        let resetBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(leftBarButtonItemTapped))
        
        let fetchBarButtonItem = UIBarButtonItem(title: "List", style: .plain, target: self, action: #selector(rightBarButtonItemTapped))
        
        navigationItem.setLeftBarButton(resetBarButtonItem, animated: false)
        navigationItem.setRightBarButton(fetchBarButtonItem, animated: false)
    }
    
    @objc fileprivate func leftBarButtonItemTapped() {
        self.navigationController?.pushViewController(HomeView(), animated: true)
    }
    
    @objc fileprivate func rightBarButtonItemTapped() {
        self.navigationController?.pushViewController(ListViewController(), animated: true)
    }
    
    fileprivate func setupViews() {
        view.addSubview(activityIndicator)
        view.backgroundColor = .white
    }
}
