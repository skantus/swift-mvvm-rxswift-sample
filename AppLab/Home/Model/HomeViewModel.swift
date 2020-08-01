//
//  HomeViewModel.swift
//  AppLab
//
//  Created by Alejo Castaño on 29/07/2020.
//  Copyright © 2020 Alejo Castaño. All rights reserved.
//

import Foundation

class HomeViewModel {
    
    private weak var view: HomeView?
    private var router: HomeRouter?
    
    func bind(view: HomeView, router: HomeRouter) {
        self.view = view
        self.router = router
    }
}
