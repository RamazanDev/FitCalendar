//
//  NewDayVC.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class NewDayVC: UIViewController {
    
    // MARK: - Views
    
    private var tableView: UITableView!
    
    // MARK: - Public properties
    
    var presenter: NewDayViewOutput?
    
    // MARK: - Private properties
    
    private var viewModel: NewDayViewModel?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewIsReady()
    }
    
    // MARK: - Setup view funcs

    
    private func setupView() {
        self.view.backgroundColor = .black
        self.title = "Новая тренировка"
        self.navigationItem.backBarButtonItem?.title = ""
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero)
        self.view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}

// MARK: - UITableViewDataSource

extension NewDayVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.rows.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let row = viewModel?.rows[indexPath.row] else {return UITableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: row.identifier, for: indexPath)
        row.configurator.configure(cell: cell)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension NewDayVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(type: viewModel!.rows[indexPath.row])
    }
    
}

// MARK: - ProfileViewInput

extension NewDayVC: NewDayViewInput {
    func setup(viewModel: NewDayViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
}
