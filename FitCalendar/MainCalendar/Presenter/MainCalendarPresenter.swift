//
//  MainCalendarPresenter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 26.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//
import RealmSwift

final class MainCalendarPresenter {
    
    // MARK: - Public properties
    
    weak var view: MainCalendarViewInput?
    
    // MARK: - Private properties
    
    private let coreService: CoreFactory
    private let router: MainCalendarRouterInput
    
    // MARK: - Init
    
    init(coreService: CoreFactory, router: MainCalendarRouterInput) {
        self.coreService = coreService
        self.router = router
    }
    
    private func getDays() -> [DayModel] {
        let dayModel = DayModel()
        dayModel.date = Date()
        for i in 0...5 {
            var ex = ExerciseModel()
            ex.name = "Трения \(i)"
            dayModel.exercises.append(ex)
        }
        try! coreService.realm.write {
            coreService.realm.add(dayModel)
         }
        return Array(coreService.realm.objects(DayModel.self))
    }
    
}

// MARK: - MaincalendarViewOutput

extension MainCalendarPresenter: MaincalendarViewOutput {
    func viewIsReady() {
        view?.setup(days: getDays())
    }
}
