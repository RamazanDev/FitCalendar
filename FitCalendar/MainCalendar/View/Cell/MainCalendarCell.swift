//
//  MainCalendarCell.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 24.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit
import SnapKit

final class MainCalendarCell: UICollectionViewCell {
    
    // MARK: - Views
    
    private var titleLabel: UILabel!
    private var tableView: UITableView!
    
    // MARK: - Private properties
    
    private var dayModel: DayModel!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupTitleLabel()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        self.addSubview(titleLabel)
        
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = 1
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .red
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(15)
            make.left.equalToSuperview()
        }
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero)
        self.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .black
        tableView.isUserInteractionEnabled = false
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setup(with model: DayModel) {
        self.dayModel = model
        titleLabel.text = model.date.stringValueFullWithTime()
        tableView.reloadData()
    }
    
}

// MARK: - UITableViewDataSource

extension MainCalendarCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dayModel.exercises.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dayModel.exercises[indexPath.row].name
        return cell
    }
    
}
