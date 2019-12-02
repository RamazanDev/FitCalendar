//
//  MainCalendarVC.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 24.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit
import SnapKit

final class MainCalendarVC: UIViewController {
    
    // MARK: - VIews
    
    private var collectionView: UICollectionView!
    
    // MARK: - Public properties
    
    var presenter: MainCalendarViewOutput?
    
    // MARK: - Private properties
    
    private var viewModel: MainCalendarViewModel?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewIsReady()
    }
    
    // MARK: - Setup view funcs
    
    private func setupView() {
        let date = Date()
        self.title = date.stringValueFullWithTime()
        let navBar = navigationController?.navigationBar
        navBar?.prefersLargeTitles = true
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MainCalendarCell.self,
                                forCellWithReuseIdentifier: "MainCalendarCell")
        collectionView.register(AddTraningDayCollectionCell.self,
                                forCellWithReuseIdentifier: "AddTraningDayCollectionCell")
        
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
}

// MARK: - UICollectionViewDelegate

extension MainCalendarVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        presenter?.didSelectRow(rowType: viewModel!.rows[indexPath.row], index: indexPath.row)
    }
}

// MARK: - UICollectionViewDataSource

extension MainCalendarVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return viewModel?.rows.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let row = viewModel?.rows[indexPath.row] else {return UICollectionViewCell()}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: row.identifier, for: indexPath)
        row.configurator.configure(cell: cell)
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainCalendarVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (self.view.frame.width)/2.3
        
        return CGSize(width: w, height: w)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
}

// MARK: - MainCalendarViewInput

extension MainCalendarVC: MainCalendarViewInput {
    func setup(viewModel: MainCalendarViewModel) {
        self.viewModel = viewModel
        collectionView.reloadData()
    }
}
