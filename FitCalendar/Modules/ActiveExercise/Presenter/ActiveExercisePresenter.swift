//
//  ActiveExercisePresenter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 29.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import Foundation

final class ActiveExercisePresenter {
    
    // MARK: - Public properties
    
    weak var view: ActiveExerciseViewInput?
    
    // MARK: - Private properties
    
    private let coreService: CoreFactory
    private let dataSource: ActiveExerciseTableDataSourceInput
    private let router: ActiveExerciseRouterInput
    private let primaryKey: String
    private var exercise: ExerciseModel!
    
    // MARK: - Init
    
    init(coreService: CoreFactory, dataSource: ActiveExerciseTableDataSourceInput, router: ActiveExerciseRouterInput, primaryKey: String) {
        self.coreService = coreService
        self.dataSource = dataSource
        self.router = router
        self.primaryKey = primaryKey
    }
    
}

// MARK: - ActiveExerciseViewOutput

extension ActiveExercisePresenter: ActiveExerciseViewOutput {
    func viewIsReady() {
        exercise = coreService.realm.object(ofType: ExerciseModel.self, forPrimaryKey: primaryKey)
        view?.setTitleView(exercise.name)
        if let result = exercise.result {
            dataSource.reload(repetitions: Array(result.repetitions))
        }
    }
    
    func addRepetition(weight: Float, count: Int) {
        
        let rep = ExerciseRepetitionModel()
        rep.weight = weight
        rep.count = count
        
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
    
    func weightIsClicked() {
        router.showPickerPopUp(delegate: self, dataArray: ["100","200","300"], type: .weightExercise)
    }
    
    func countIsClicked() {
        router.showPickerPopUp(delegate: self, dataArray: ["1","2","3"], type: .countExercise)
    }
    
}

// MARK: - ActiveExerciseTableDataSourceOutput

extension ActiveExercisePresenter: ActiveExerciseTableDataSourceOutput {
    
}

// MARK: - PickerOutput

extension ActiveExercisePresenter: PickerOutput {
    func saveButtonIsClicked(with param: String, type: PickerContentType) {
        switch type {
        case .weightExercise:
            view?.setWeight(weight: (param as NSString).floatValue)
        case .countExercise:
            view?.setCount(count: Int(param)!)
        }
    }
    
}
