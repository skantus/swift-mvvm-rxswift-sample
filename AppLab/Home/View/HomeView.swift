//
//  HomeView.swift
//  AppLab
//
//  Created by Alejo Castaño on 29/07/2020.
//  Copyright © 2020 Alejo Castaño. All rights reserved.
//

import Foundation
import UIKit

class HomeView: UIViewController {
    
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeTitle())
        view.backgroundColor = .white
        
        viewModel.bind(view: self, router: router)
    }
    
    func homeTitle() -> UILabel {
        let label: UILabel = UILabel(frame: CGRect(x: 140, y: 300, width: 200, height: 200))
        label.text = "Home View"
        label.textColor = .systemBlue
        return label
    }
}
