//
//  SeparatorTableViewCell.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 09.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class SeparatorTableViewCell: UITableViewCell {
    
    private var valueLabel: UILabel!
    
    // MARK: - Init
    
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupValueLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup views funcs
    
    private func setupCell() {
        self.selectionStyle = .none
    }
    
    private func setupValueLabel() {
        valueLabel = UILabel(frame: .zero)
        self.addSubview(valueLabel)
        
        valueLabel.textColor = .white
        valueLabel.backgroundColor = .clear
        valueLabel.numberOfLines = 0
        
        valueLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(valueLabel)
            make.height.equalTo(20)
        }
        
    }
}

// MARK: - Configurable

extension SeparatorTableViewCell: Configurable {
    struct Model {}
    func configure(with model: SeparatorTableViewCell.Model) {}
}
