//
//  HomeViewModel.swift
//  AppLab
//
//  Created by Alejo Castaño on 29/07/2020.
//  Copyright © 2020 Alejo Castaño. All rights reserved.
//

import Foundation
import RxSwift

class HomeViewModel {
    
    private weak var view: HomeView?
    private var router: HomeRouter?
    private var managerConnection = ManagerConnection()
    
    func bind(view: HomeView, router: HomeRouter) {
        self.view = view
        self.router = router
        self.router?.setSourceView(sourceView: view)
    }
    
    func getListMoviesData() -> Observable<[Movie]> {
        return managerConnection.getPopularMovies()
    }
    
}
