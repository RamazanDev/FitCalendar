//
//  AddTraningDayCollectionCell.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 27.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit
import Lottie

final class AddTraningDayCollectionCell: UICollectionViewCell {
    
    // MARK: - Views
    
    private var animationView: AnimationView!

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupAnimationView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupViews
    
    private func setupAnimationView() {
        animationView = AnimationView(frame: .zero)
        self.addSubview(animationView)
        let animation = Animation.named("addLottie")
        animationView.animation = animation
            
        animationView.snp.makeConstraints { (make) in
            make.height.equalTo(100)
            make.width.equalTo(100)
            make.center.equalToSuperview()
        }
    }
    
}

// MARK: - Configurable

extension AddTraningDayCollectionCell: Configurable {
    struct Model {
        
    }
    
    func configure(with model: AddTraningDayCollectionCell.Model) {
        animationView.play()
    }
}
