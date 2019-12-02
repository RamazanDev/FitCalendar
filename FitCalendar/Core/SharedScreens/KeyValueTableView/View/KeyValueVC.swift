//
//  KeyValueVC.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 29.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class KeyValueVC: UIViewController {
    
    // MARK: - Views
    
    private var tableView: UITableView!
    
    // MARK: - Private properties
    
    private var items: [KeyValue] = []
    
    // MARK:  - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
    }
    
    // MARK: - Public funcs
    
    func setup(items: [KeyValue], title: String) {
        self.title = title
        self.items = items
        tableView.reloadData()
    }
    
    // MARK: - Setup view funcs
    
    private func setupView() {
    
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero)
        self.view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.register(TextWithArrowCell.self, forCellReuseIdentifier: "KeyValueCell")
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}

// MARK: - UITableViewDataSource

extension KeyValueVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KeyValueCell", for: indexPath) as? KeyValueCell else { fatalError() }
        
        let item = items[indexPath.row]
        cell.configure(with: KeyValueCell.Model(key: item.getKey(), value: item.getValue() as! String))
        
        return cell
    }
    
}
