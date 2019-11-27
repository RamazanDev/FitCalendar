//
//  MainCalendarDataSource.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 24.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class MainCalendarDataSource: NSObject {
    
    weak var collectionView: UICollectionView?
    
    func reloadTable() {
        collectionView?.reloadData()
    }
    
}

// MARK: - UICollectionViewDelegate

extension MainCalendarDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

// MARK: - UICollectionViewDataSource

extension MainCalendarDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = MainCalendarCell()
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainCalendarDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 200)
    }
    
}
