//
//  KeyValueWithArrowCell.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 29.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class KeyValueWithArrowCell: UITableViewCell {
    
    // MARK: - Views
    
    private var keyLabel: UILabel!
    private var valueLabel: UILabel!
    
    // MARK: - Init
    
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupValueLabel()
        setupTitleLabel()
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
        valueLabel.font = keyLabel.font.withSize(16)
        
        valueLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(valueLabel)
            make.height.equalTo(20)
            make.right.equalTo(valueLabel).offset(-16)
            make.left.greaterThanOrEqualTo(keyLabel).offset(8)
        }
        
    }
    
    private func setupTitleLabel() {
        keyLabel = UILabel(frame: .zero)
        self.addSubview(keyLabel)
        
        keyLabel.textColor = .white
        keyLabel.backgroundColor = .clear
        keyLabel.numberOfLines = 0
        keyLabel.font = keyLabel.font.withSize(16)
        
        keyLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(20)
            make.bottom.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(valueLabel).offset(8)
        }
    }
    
}

// MARK: - Configurable

extension KeyValueWithArrowCell: Configurable {
    
    struct Model {
        let key: String
        let value: String
    }
    
    func configure(with model: KeyValueCell.Model) {
        self.keyLabel.text = model.key
        self.valueLabel.text = model.value
    }
}
