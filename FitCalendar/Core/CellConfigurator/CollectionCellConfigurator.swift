//
//  CollectionCellConfigurator.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 27.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import Foundation
import UIKit

class CollectionCellConfigurator<CellType: Configurable, Model>: CellConfigurator where CellType.Model == Model, CellType: UICollectionViewCell {
    
    static var reuseId: String { return String(describing: CellType.self) }
    
    let item: Model
    
    init(item: Model) {
        self.item = item
    }
    
    func configure(cell: UIView) {
        (cell as? CellType)?.configure(with: item)
    }
}
