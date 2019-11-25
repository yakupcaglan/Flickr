//
//  HomeViewControlller.swift
//  Flicker_Demo
//
//  Created by yakup caglan on 20.11.2019.
//  Copyright © 2019 yakup caglan. All rights reserved.
//

import UIKit

final class HomeViewController: LayoutingViewController {
   
    typealias ViewType = HomeView
    
    private let viewModel: HomeViewModel
    
    public required init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
    
        view = ViewType.create()
    }
    //MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Recent Photos"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.delegate = self
        viewModel.loadPhotos()
        
        layoutableView.collectionView.delegate = self
        layoutableView.collectionView.dataSource = self
    }
    
}

//MARK:- CollectionView Delegat & Datasource Methods
extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int
    ) -> Int {
        return self.viewModel.numberOfPhotos
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
    
        let cell: HomeCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.item = self.viewModel.item(at: indexPath.row)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
       
        if let cell = collectionView.cellForItem(at: indexPath) as? HomeCell {
            guard let image = cell.imageView.image else { return }
            let detailViewController = DetailViewControllerFactory.create(with: image)
            
            self.navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        
        guard indexPath.row >= self.viewModel.numberOfPhotos - 1 else { return }
        
        self.viewModel.isRefreshing = true
    }
}

extension HomeViewController: HomeViewModelDelegate {
    
    func refreshStateDidChange(from viewModel: HomeViewModel) {
        self.viewModel.loadPhotos()
    }
    
    func photosDidChange(from viewModel: HomeViewModel) {
        self.viewModel.isRefreshing = false
        self.layoutableView.collectionView.reloadData()
    }
}
