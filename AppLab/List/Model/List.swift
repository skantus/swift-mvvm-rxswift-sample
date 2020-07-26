//
//  List.swift
//  AppLab
//
//  Created by Alejo Castaño on 26/07/2020.
//  Copyright © 2020 Alejo Castaño. All rights reserved.
//

import Foundation

class List: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    init(userId: Int, id: Int, title: String, body: String) {
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
    }
}
