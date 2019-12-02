//
//  KeyValueCell.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 29.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class KeyValueCell: UITableViewCell {
    
    // MARK: - Views
    
    private var keyLabel: UILabel!
    private var valueLabel: UILabel!
    private var arrowImageView: UIImageView!
    
    // MARK: - Init
    
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupKeyLabel()
        setupValueLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup views funcs
    
    private func setupCell() {
        self.selectionStyle = .none
    }
    
    private func setupKeyLabel() {
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
            make.right.equalToSuperview().offset(-60)
        }
    }
    
    private func setupValueLabel() {
        valueLabel = UILabel(frame: .zero)
        self.addSubview(valueLabel)
        
        valueLabel.textColor = .white
        valueLabel.backgroundColor = .clear
        valueLabel.numberOfLines = 0
        valueLabel.font = valueLabel.font.withSize(16)
        
        valueLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.centerX.equalTo(valueLabel)
            make.right.equalToSuperview().offset(-16)
        }
        
    }
    
}

// MARK: - Configurable

extension KeyValueCell: Configurable {
    
    struct Model {
        let key: String
        let value: String
    }
    
    func configure(with model: KeyValueCell.Model) {
        self.keyLabel.text = model.key
        self.valueLabel.text = model.value
    }
}
