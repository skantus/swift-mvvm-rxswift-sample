//
//  HomeRouter.swift
//  AppLab
//
//  Created by Alejo Castaño on 28/07/2020.
//  Copyright © 2020 Alejo Castaño. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter {
    
    var viewController: UIViewController {
        return createViewController()
    }
    
    private var sourceView: UIViewController?
    
    private func createViewController() -> UIViewController {
        let viewC = HomeView();
        return viewC
    }
    
    func setSourceView(sourceView: UIViewController?) {
        guard let view = sourceView else { fatalError("Unknow Error") }
        self.sourceView = view
    }
    
}
