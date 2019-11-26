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
    
    var presenter: MaincalendarViewOutput?
    
    // MARK: - Private properties
    
    private var days: [DayModel]?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectioView()
        presenter?.viewIsReady()
    }
    
    // MARK: - Setup view funcs
    
    private func setupCollectioView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MainCalendarCell.self, forCellWithReuseIdentifier: "MainCalendarCell")
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
    }
    
}

// MARK: - UICollectionViewDelegate

extension MainCalendarVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

// MARK: - UICollectionViewDataSource

extension MainCalendarVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return days?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCalendarCell", for: indexPath) as? MainCalendarCell else {fatalError()}
        cell.setup(with: days![indexPath.row])
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainCalendarVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (self.view.frame.width)/2.3
        let h = w * 650 / 375
        
        return CGSize(width: w, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
}

// MARK: - MainCalendarViewInput

extension MainCalendarVC: MainCalendarViewInput {
    func setup(days: [DayModel]) {
        self.days = days
        collectionView.reloadData()
    }
}
