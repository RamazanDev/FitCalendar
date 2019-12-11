//
//  MuscleGroupExercisesPresenter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 11.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

final class MuscleGroupExercisesPresenter {
    
    // MARK: - Public properties
    
    weak var view: MuscleGroupExercisesViewInput?
    
    // MARK: - Private properties
    
    private let coreService: CoreFactory
    private var exercises: [ExerciseModel] = []
    
    // MARK: - Init
    
    init(coreService: CoreFactory) {
        self.coreService = coreService
    }
    
}

// MARK: - MuscleGroupExercisesViewOutput

extension MuscleGroupExercisesPresenter: MuscleGroupExercisesViewOutput {
    func didSelectRow(index: Int) {
        
    }
    
    func plusButtonIsClicked() {
        
    }
    
    func removeAction(index: Int) {
        
    }
    
    func viewIsReady() {
        view?.setup(exerciseTitles: ["1","2"])
    }
    
}
