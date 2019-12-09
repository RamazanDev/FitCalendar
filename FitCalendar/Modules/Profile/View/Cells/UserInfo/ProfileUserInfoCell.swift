//
//  ProfileUserInfoCell.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 09.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class ProfileUserInfoCell: UITableViewCell {
    
    // MARK: - Views
    
    private var userImageView: UIImageView!
    private var nameLabel: UILabel!
    private var lastTraningTimeLabel: UILabel!
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
        setupUserImageView()
        setupNameLabel()
        setupLastTrainingTimeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup views funcs
    
    private func setupCell() {
        selectionStyle = .none
    }
    
    private func setupUserImageView() {
        userImageView = UIImageView(frame: .zero)
        userImageView.corner(angle: 50)
        self.addSubview(userImageView)
        
        userImageView.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func setupNameLabel() {
        nameLabel = UILabel(frame: .zero)
        nameLabel.font = nameLabel.font.withSize(20)
        nameLabel.textColor = .white
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(userImageView.snp.right).offset(10)
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalTo(userImageView).offset(-16)
        }
    }
    
    private func setupLastTrainingTimeLabel() {
        lastTraningTimeLabel = UILabel(frame: .zero)
        lastTraningTimeLabel.font = lastTraningTimeLabel.font.withSize(16)
        lastTraningTimeLabel.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        lastTraningTimeLabel.numberOfLines = 0
        self.addSubview(lastTraningTimeLabel)
        
        lastTraningTimeLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(nameLabel)
            make.trailing.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
        }
    }
    
    
}

// MARK: - Configurable

extension ProfileUserInfoCell: Configurable {
    
    struct Model {
        let image: UIImage
        let name: String
        let lastTrainingTime: String
    }
    
    func configure(with model: ProfileUserInfoCell.Model) {
        userImageView.image = model.image
        nameLabel.text = model.name
        lastTraningTimeLabel.text = model.lastTrainingTime
    }
    
}
