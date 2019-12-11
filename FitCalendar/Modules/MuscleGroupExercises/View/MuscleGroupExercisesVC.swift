//
//  MuscleGroupExercisesVC.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 11.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class MuscleGroupExercisesVC: UIViewController {
    
    // MARK: - VIews
    
    private var tableView: UITableView!
    
    // MARK: - Public properties
    
    var presenter: MuscleGroupExercisesViewOutput?
    
    // MARK: - Private properties
    
    private var items: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        setupPlusdButtomFromNavigationBar()
        presenter?.viewIsReady()
    }
    
    // MARK: - Setup view funcs
    
    private func setupView() {
        self.view.backgroundColor = .black
        
        self.navigationItem.largeTitleDisplayMode = .always
        
        let navBar = navigationController?.navigationBar
        navBar?.prefersLargeTitles = true
    }
    
    private func setupTableView() {
        tableView = UITableView(frame: .zero)
        self.view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.register(TextWithArrowCell.self, forCellReuseIdentifier: "TextWithArrowCell")
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupPlusdButtomFromNavigationBar() {
        let plusButton = UIBarButtonItem(image: #imageLiteral(resourceName: "plusIcon").withTintColor(.white), style: .done, target: self, action: #selector(plusButtonClick))
        navigationItem.rightBarButtonItem = plusButton
    }
    
    // MARK: - Actions
    
    @objc private func plusButtonClick(_sender: UIBarButtonItem) {
        presenter?.plusButtonIsClicked()
    }
    
}

// MARK: - UITableViewDelegate

extension MuscleGroupExercisesVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        presenter?.removeAction(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        
        return .delete
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Удалить"
    }
    
}

// MARK: - UITableViewDataSource

extension MuscleGroupExercisesVC: UITableViewDataSource {
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

// MARK: - MuscleGroupExercisesViewInput

extension MuscleGroupExercisesVC: MuscleGroupExercisesViewInput {
    func setup(exerciseTitles: [String]) {
        self.items = exerciseTitles
        tableView.reloadData()
    }
    
}
