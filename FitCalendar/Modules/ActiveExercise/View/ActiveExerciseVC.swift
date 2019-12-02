//
//  ActiveExerciseVC.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 29.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class ActiveExerciseVC: UIViewController {
    
    // MARK: - VIews
    
    private var tableView: UITableView!
    private var exerciseCreateView: UIView!
            
    // MARK: - Public properties
    
    var dataSource: ActiveExerciseTableDataSource?
    var presenter: ActiveExerciseViewOutput?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupExerciseCreateView()
        setupRepetTableView()
        presenter?.viewIsReady()
    }
    
    // MARK: - Setup view funcs
    
    private func setupView() {
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupExerciseCreateView() {
        exerciseCreateView = UIView(frame: .zero)
        exerciseCreateView.backgroundColor = #colorLiteral(red: 0.104290314, green: 0.1036779061, blue: 0.1047658846, alpha: 1)

        self.view.addSubview(exerciseCreateView)
        
        exerciseCreateView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(self.navigationController!.navigationBar.frame.height)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    private func setupCountPicker() {
        
    }
    
    private func setupWeightPicker() {
        
    }
    
    private func setupAddRepetButton() {
        
    }
    
    private func setupRepetTableView() {
        tableView = UITableView(frame: .zero)
        self.view.addSubview(tableView)

        tableView.backgroundColor = .clear
        tableView.register(KeyValueCell.self, forCellReuseIdentifier: "KeyValueCell")
        dataSource?.tableView = tableView
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(exerciseCreateView.snp.bottom)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
    
}

// MARK: - ActiveExerciseViewInput

extension ActiveExerciseVC: ActiveExerciseViewInput {
    func setTitleView(_ title: String) {
        self.title = title
    }
    
}
