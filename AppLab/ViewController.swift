//
//  ViewController.swift
//  AppLab
//
//  Created by Alejo Castaño on 19/07/2020.
//  Copyright © 2020 Alejo Castaño. All rights reserved.
//

import UIKit
import TinyConstraints

class ViewController: UIViewController {

    var listViewModel = ViewModelList()
    var listTableView: UITableView!
    
    private let cellId = "cellId"
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: .medium)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNavigation()
        setupTableView()
        setupViews()
    }
    
    fileprivate func setupNavigation() {
        let resetBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(resetBarButtonItemTapped))
        
        let fetchBarButtonItem = UIBarButtonItem(title: "Fetch", style: .plain, target: self, action: #selector(fetchBarButtonItemTapped))
        
        navigationItem.setLeftBarButton(resetBarButtonItem, animated: false)
        navigationItem.setRightBarButton(fetchBarButtonItem, animated: false)
    }
    
    @objc fileprivate func resetBarButtonItemTapped() {
        activityIndicator.isHidden = true
        navigationItem.title = "Reset"
        
        self.listTableView.reloadData()
    }
    
    @objc fileprivate func fetchBarButtonItemTapped() {
        activityIndicator.isHidden = false
        navigationItem.title = "Fetching..."

        activityIndicator.startAnimating()
        listViewModel.retreiveDataList()
        bindList()
    }
    
    fileprivate func setupViews() {
        view.addSubview(activityIndicator)
        activityIndicator.centerXToSuperview()
        view.backgroundColor = .white
    }
    
    func setupTableView() {
      let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
      let displayWidth: CGFloat = self.view.frame.width
      let displayHeight: CGFloat = self.view.frame.height

      listTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
      listTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
      listTableView.dataSource = self
      listTableView.delegate = self
      
      self.view.addSubview(listTableView)
    }
    
    private func bindList() {
        listViewModel.refreshData = { [weak self] () in
            DispatchQueue.main.sync {
                self?.listTableView.reloadData()
                self?.activityIndicator.stopAnimating()
                self?.navigationItem.title = "Loaded data!"
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
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
