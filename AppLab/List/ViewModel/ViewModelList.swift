//
//  ViewModelList.swift
//  AppLab
//
//  Created by Alejo Castaño on 26/07/2020.
//  Copyright © 2020 Alejo Castaño. All rights reserved.
//

import Foundation

class ViewModelList {
    
    var refreshData = {
        () -> () in
    }
    
    var dataArray: [List] = [] {
        didSet {
            refreshData()
        }
    }
    
    func retreiveDataList() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let json = data else { return }
            
            do {
                let decoder = JSONDecoder()
                self.dataArray = try decoder.decode([List].self, from: json)
            } catch let error {
                print("An error has been ocurred \(error.localizedDescription)")
            }
        }.resume()
    }
    
}
