//
//  HomeView.swift
//  AppLab
//
//  Created by Alejo Castaño on 29/07/2020.
//  Copyright © 2020 Alejo Castaño. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class HomeView: UIViewController {
    
    private var router = HomeRouter()
    private var viewModel = HomeViewModel()
    private var disposeBag = DisposeBag()
    private var movies = [Movie]()
    private let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureCollectionView()

        viewModel.bind(view: self, router: router)
        getData()
    }

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CustomeMovieCell.self, forCellWithReuseIdentifier: cellId)
        setupCollectionConstraints()
    }
    
    func setupCollectionConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: view.bounds.height).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
    private func getData() {
        return viewModel.getListMoviesData()
            .subscribeOn(MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe(
                onNext: { movies in
                    self.movies = movies
                    self.reloadViewList()
            }, onError: {error in
                print(error)
            }, onCompleted: {
            }).disposed(by: disposeBag)
    }
    
    private func reloadViewList() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomeMovieCell
        
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 5
        
        cell.imageView.imageFromServerUrl(urlString: "\(Constants.URL.urlImages+self.movies[indexPath.row].image)", placeHolderImage: UIImage(named: "movie_placeholder")!)
        cell.titleLabel.text = movies[indexPath.row].title
        cell.descriptionLabel.text = movies[indexPath.row].sinopsis
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width - 20, height: 400)
    }
}
