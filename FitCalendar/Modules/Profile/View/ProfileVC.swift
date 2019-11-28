//
//  ProfileVC.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class ProfileVC: UIViewController {
    
    // MARK: - Views
    
    private var tableView: UITableView!
    
    // MARK: - Public properties
    
    var presenter: ProfileViewOutput?
    
    // MARK: - Private properties
    
    private var viewModel: ProfileViewModel?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter?.viewIsReady()
    }
    
    // MARK: - Setup view funcs
    
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

extension ProfileVC: UITableViewDataSource {
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

extension ProfileVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(type: viewModel!.rows[indexPath.row])
    }
    
}

// MARK: - ProfileViewInput

extension ProfileVC: ProfileViewInput {
    func setup(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
        tableView.reloadData()
    }
    
}
