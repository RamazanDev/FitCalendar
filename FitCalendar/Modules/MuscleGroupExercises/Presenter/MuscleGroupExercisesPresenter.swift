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
    private let muscleGroup: MuscleGroupModel
    private var exercises: [ExerciseModel] = []
    
    // MARK: - Init
    
    init(muscleGroup: MuscleGroupModel, coreService: CoreFactory) {
        self.muscleGroup = muscleGroup
        self.coreService = coreService
    }
    
}

// MARK: - MuscleGroupExercisesViewOutput

extension MuscleGroupExercisesPresenter: MuscleGroupExercisesViewOutput {
    func addExercise(with name: String) {
        
        let exercise = ExerciseModel()
        exercise.name = name
        exercise.muscleGroupID = muscleGroup.id
        
        try! coreService.realm.write {
            coreService.realm.add(exercise)
        }
        self.viewIsReady()
        
    }
    
    func didSelectRow(index: Int) {
        
    }
    
    func plusButtonIsClicked() {
        view?.showAlertForInputExreciseName()
    }
    
    func removeAction(index: Int) {
        
    }
    
    func viewIsReady() {
        view?.setTitle(muscleGroup.name)
        
        if muscleGroup.id == "0" {
            self.view?.setup(exerciseTitles: coreService.realm.objects(ExerciseModel.self).map({ (exercise) -> String in
                exercise.name
            }))
            return
        }
        let list = coreService.realm.objects(ExerciseModel.self).filter("muscleGroupID == %@", muscleGroup.id)
        let titles = list.map { (exercise) -> String in
            return exercise.name
        }
        view?.setup(exerciseTitles: Array(titles))
    }
    
}
