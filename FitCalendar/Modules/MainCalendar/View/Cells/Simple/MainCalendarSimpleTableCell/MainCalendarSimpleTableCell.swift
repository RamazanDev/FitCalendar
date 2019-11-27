//
//  MainCalendarSimpleTableCell.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 27.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit
import SnapKit

final class MainCalendarSimpleTableCell: UITableViewCell {
    
    // MARK: - Views
    
    private var exerciseNameLabel: UILabel!
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSelfCell()
        setupTextLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup views funcs
    
    private func setupSelfCell() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
    }
    
    private func setupTextLabel() {
        exerciseNameLabel = UILabel(frame: .zero)
        self.addSubview(exerciseNameLabel)
        
        exerciseNameLabel.numberOfLines = 1
        exerciseNameLabel.textColor = #colorLiteral(red: 0.7685997486, green: 0.7640322447, blue: 0.7721117139, alpha: 1)
        exerciseNameLabel.font = exerciseNameLabel.font.withSize(12)
        
        exerciseNameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(0)
            make.height.equalTo(16)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    // MARK: - Public func
    
    func setup(text: String) {
        exerciseNameLabel.text = text
    }
    
}
