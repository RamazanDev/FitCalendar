//
//  NewDayPresenter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import Foundation

final class NewDayPresenter {
    
    // MARK: - Public properties
    
    weak var view: NewDayViewInput?
    
    // MARK: - Private properties
    
    private let dataProvider: NewDayDataConverterInput
    private let router: NewDayRouterInput
    private let coreService: CoreFactory
    private var model = DayModel(date: Date(), exercises: nil)
    
    // MARK: - Init
    
    init(dataProvider: NewDayDataConverterInput, router: NewDayRouterInput, coreService: CoreFactory) {
        self.dataProvider = dataProvider
        self.router = router
        self.coreService = coreService
        addNewDayInRealm()
    }
    
    private func addNewDayInRealm() {
        try! coreService.realm.write {
            coreService.realm.add(model)
        }
    }
}

// MARK: - ProfileViewOutput

extension NewDayPresenter: NewDayViewOutput {
    func removeExercise(with id: Int) {
        try! coreService.realm.write({
            model.exercises.remove(at: id)
        })
        viewIsReady()
    }
    
    func addExercise(with name: String) {
        let exercise = ExerciseModel()
        exercise.name = name
        try! coreService.realm.write({
            model.exercises.append(exercise)
        })
        viewIsReady()
    }
    
    func viewIsReady() {
        let viewModel = dataProvider.createView(exercises: Array(model.exercises))
        view?.setup(viewModel: viewModel)
    }
    
    func didSelectRow(type: NewDayViewModel.Row, index: Int) {
        switch type {
        case .exercise:
            router.openActiveExerciseModule(with: Array(model.exercises)[index].id)
        case .addExercise:
            self.view?.showAlertForInputExreciseName()
        }
    }
}
