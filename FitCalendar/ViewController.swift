//
//  ViewController.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 24.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var heightConstrain: Constraint? = nil
    
    lazy var bakView: UIView = {
        var v = UIView()
        v.backgroundColor = .brown
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(bakView)
        bakView.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            heightConstrain = make.height.equalTo(100).constraint
            make.width.equalTo(100)
        }
        print(heightConstrain)
        UIView.animate(withDuration: 1.0) {
            
            self.view.layoutIfNeeded()
        }
        
    }
    // Do any additional setup after loading the view.
    
}

