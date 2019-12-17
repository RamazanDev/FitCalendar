//
//  KeyArrowVC.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 16.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class KeyArrowVC: UIViewController {
    
    // MARK: - Views
    
    private var tableView: UITableView!
    
    // MARK: - Private properties
    
    private var items: [String] = []
    private var delegate: KeyArrowViewOutput?
    // MARK:  - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    // MARK: - Public funcs
    
    func setup(items: [String], title: String, delegate: KeyArrowViewOutput) {
        self.title = title
        self.items = items
        self.delegate = delegate
        tableView.reloadData()
    }
    
    // MARK: - Setup view funcs
    
    private func setupView() {
    
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero)
        self.view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.register(TextWithArrowCell.self, forCellReuseIdentifier: "TextWithArrowCell")
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}

// MARK: - UITableViewDataSource

extension KeyArrowVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextWithArrowCell", for: indexPath) as? TextWithArrowCell else { fatalError() }
        
        let item = items[indexPath.row]
        cell.configure(with: item)
        
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension KeyArrowVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRow(index: indexPath.row)
    }
    
}
