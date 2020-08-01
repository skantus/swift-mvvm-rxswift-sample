//
//  PostsListViewController.swift
//  AppLab
//
//  Created by Alejo Castaño on 28/07/2020.
//  Copyright © 2020 Alejo Castaño. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    var listTableView: UITableView!
    var listViewModel = ViewModelList()
    
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        let barHeight: CGFloat = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height

        listTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        listTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        listTableView.dataSource = self
        listTableView.delegate = self
     
        self.view.addSubview(listTableView)
        
        listViewModel.retreiveDataList()
        bindList()
    }
    
    private func bindList() {
        listViewModel.refreshData = { [weak self] () in
            DispatchQueue.main.sync {
                self?.listTableView.reloadData()
            }
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listViewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath as IndexPath)
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellId)
        
        let object = listViewModel.dataArray[indexPath.row]

        cell.textLabel!.text = object.title
        cell.textLabel!.numberOfLines = 2
        cell.detailTextLabel?.text = object.body
        
        return cell
    }
}
