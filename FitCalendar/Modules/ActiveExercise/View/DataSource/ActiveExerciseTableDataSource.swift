//
//  ActiveExerciseTableDataSource.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 01.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class ActiveExerciseTableDataSource: NSObject {
    
    // MARK: - Views
    
    weak var tableView: UITableView?
    var delegate: ActiveExerciseTableDataSourceOutput?
    
    // MARK: - Private properties
    
    private var repetitions: [ExerciseRepetitionModel] = []
    
}

// MARK: - ActiveExerciseTableDataSource

extension ActiveExerciseTableDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repetitions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "KeyValueCell", for: indexPath) as? KeyValueCell else {return UITableViewCell()}
        
        let repet = repetitions[indexPath.row]
        let key = "\(repet.phase). \(repet.weight.preparingForShowIntOrFloatDescription())"

        cell.configure(with: KeyValueCell.Model(key: key, value: repet.count.description))
        
        return cell
    }
    
}

// MARK: - ActiveExerciseTableDataSource

extension ActiveExerciseTableDataSource: UITableViewDelegate {
    
}

// MARK: - ActiveExerciseTableDataSourceInput

extension ActiveExerciseTableDataSource: ActiveExerciseTableDataSourceInput {
    func reload(repetitions: [ExerciseRepetitionModel]) {
        self.repetitions = repetitions
        tableView?.reloadData()
        tableView?.scrollToBottom()
    }
    
}
