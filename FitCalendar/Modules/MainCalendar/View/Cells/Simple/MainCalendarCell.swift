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
    
    private var backView: UIView!
    private var titleLabel: UILabel!
    private var tableView: UITableView!
    
    // MARK: - Private properties
    
    private var dayModel: DayModel!
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackView()
        setupTitleLabel()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackView() {
        backView = UIView(frame: .zero)
        self.addSubview(backView)
        
        backView.backgroundColor = #colorLiteral(red: 0.05862283707, green: 0.05864083022, blue: 0.05862047523, alpha: 1)
        backView.layer.cornerRadius = 8
        
        backView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    private func setupTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        backView.addSubview(titleLabel)
        
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = 1
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        titleLabel.font = titleLabel.font.withSize(16)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(10)
            make.height.equalTo(16)
            make.left.equalToSuperview().offset(8)
        }
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero)
        backView.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.backgroundColor = .clear
        tableView.isUserInteractionEnabled = false
        tableView.register(MainCalendarSimpleTableCell.self, forCellReuseIdentifier: "MainCalendarSimpleTableCell")
        tableView.rowHeight = 34
        tableView.separatorStyle = .none
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalToSuperview().offset(8)
            make.right.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
}

// MARK: - UITableViewDataSource

extension MainCalendarCell: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dayModel.exercises.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MainCalendarSimpleTableCell", for: indexPath) as? MainCalendarSimpleTableCell else { fatalError() }
        cell.setup(text: dayModel.exercises[indexPath.row].name)
        return cell
    }
    
}

// MARK: - Configurable

extension MainCalendarCell: Configurable {
    typealias Model = DayModel
    
    func configure(with model: MainCalendarCell.Model) {
        self.dayModel = model
        titleLabel.text = model.date.stringValueFullWithTime(format: "EEEE (dd.MM)")
        tableView.reloadData()
    }
}
