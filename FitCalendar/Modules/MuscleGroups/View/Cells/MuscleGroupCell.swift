//
//  MuscleGroupCell.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 09.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class MuscleGroupCell: UICollectionViewCell {
    
    // MARK: - Views
    
    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
        setupNameLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupImageView() {
        imageView = UIImageView(frame: .zero)
        imageView.corner(angle: 6)
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints { (make) in
            make.height.equalToSuperview().multipliedBy(0.7)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.center.equalToSuperview()
        }
    }
    
    private func setupNameLabel() {
        nameLabel = UILabel(frame: .zero)
        nameLabel.font = nameLabel.font.withSize(18)
        nameLabel.textColor = .white
        nameLabel.numberOfLines = 0

        nameLabel.layer.shadowColor = UIColor.black.cgColor
        nameLabel.layer.shadowRadius = 8.0
        nameLabel.layer.shadowOpacity = 1.0
        nameLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        nameLabel.layer.masksToBounds = false
        self.addSubview(nameLabel)
        
        nameLabel.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(4)
            make.right.equalToSuperview().offset(-4)
            make.top.greaterThanOrEqualTo(16)
        }
    }
    
}

// MARK: - Configurable

extension MuscleGroupCell: Configurable {
    struct Model {
        let image: UIImage
        let name: String
    }
    
    func configure(with model: MuscleGroupCell.Model) {
        imageView.image = model.image
        nameLabel.text = model.name
    }
}
