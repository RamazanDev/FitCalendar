//
//  AddExerciseCell.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class AddExerciseCell: UITableViewCell {
    
    // MARK: - Views
    
    private var titleLabel: UILabel!
    private var plusImageView: UIImageView!
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupPlusImageView()
        setupTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup views funcs
    
    private func setupCell() {
        self.selectionStyle = .none
    }
    
    private func setupPlusImageView() {
        plusImageView = UIImageView(frame: .zero)
        self.addSubview(plusImageView)
        
        plusImageView.image = #imageLiteral(resourceName: "plusIcon")
        plusImageView.tintColor = .white
        plusImageView.backgroundColor = .clear
        
        plusImageView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.height.equalTo(16)
            make.width.equalTo(16)
        }
    }
    
    private func setupTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        self.addSubview(titleLabel)
        
        titleLabel.textColor = .gray
        titleLabel.backgroundColor = .clear
        titleLabel.numberOfLines = 0
        titleLabel.font = titleLabel.font.withSize(16)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(20)
            make.bottom.equalToSuperview().offset(-16)
            make.left.equalTo(plusImageView).offset(24)
            make.right.equalToSuperview().offset(16)
        }
    }
    
}

// MARK: - Configurable

extension AddExerciseCell: Configurable {
    typealias Model = String
    
    func configure(with model: String) {
        self.titleLabel.text = model
    }
}
