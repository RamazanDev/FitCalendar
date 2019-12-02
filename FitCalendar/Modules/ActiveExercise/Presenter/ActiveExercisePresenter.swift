//
//  ActiveExercisePresenter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 29.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

final class ActiveExercisePresenter {
    
    // MARK: - Public properties
    
    weak var view: ActiveExerciseViewInput?
    
    // MARK: - Private properties
    
    private let coreService: CoreFactory
    private let dataSource: ActiveExerciseTableDataSourceInput
    private let primaryKey: String
    private var exercise: ExerciseModel!
    
    // MARK: - Init
    
    init(coreService: CoreFactory, dataSource: ActiveExerciseTableDataSourceInput, primaryKey: String) {
        self.coreService = coreService
        self.dataSource = dataSource
        self.primaryKey = primaryKey
    }
    
}

// MARK: - ActiveExerciseViewOutput

extension ActiveExercisePresenter: ActiveExerciseViewOutput {
    func viewIsReady() {
        let rep = ExerciseRepetitionModel()
        rep.phase = 1
        rep.weight = 100
        rep.count = 12
        exercise = coreService.realm.object(ofType: ExerciseModel.self, forPrimaryKey: primaryKey)
        view?.setTitleView(exercise.name)
        if let result = exercise.result {
            rep.phase = (result.repetitions.last!.phase) + 1

            try! coreService.realm.write {
                result.repetitions.append(rep)
            }
        } else {
            let result = ExrciceResultModel()
            result.repetitions.append(rep)
            try! coreService.realm.write {
                exercise.result = result
            }
        }


        dataSource.reload(repetitions: Array(exercise.result!.repetitions))
    }
    
    func addRepetition(weight: Float, count: Int) {
        
    }
    
}

// MARK: - ActiveExerciseTableDataSourceOutput

extension ActiveExercisePresenter: ActiveExerciseTableDataSourceOutput {

}
