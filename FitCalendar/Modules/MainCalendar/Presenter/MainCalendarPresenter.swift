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
    private let dataProvider: MainCalendarDataConverterInput
    
    // MARK: - Init
    
    init(coreService: CoreFactory,
         router: MainCalendarRouterInput,
         dataProvider: MainCalendarDataConverterInput) {
        self.coreService = coreService
        self.router = router
        self.dataProvider = dataProvider
    }
    
    // MARK: - Private funcs
    
    private func getDaysFromRealm() -> [DayModel] {
        return Array(coreService.realm.objects(DayModel.self))
    }
    
}

// MARK: - MaincalendarViewOutput

extension MainCalendarPresenter: MainCalendarViewOutput {
    func didSelectRow(rowType: MainCalendarViewModel.Row, index: Int) {
        switch rowType {
        case .addDay:
            router.openNewDayModule()
        case .simpleDay:
            print("simple \(index)")
            router.openNewDayModule()
        }
    }
    
    func viewIsReady() {
        let viewModel = dataProvider.createView(currentDate: Date(), days: getDaysFromRealm().reversed())
        view?.setup(viewModel: viewModel)
    }
}
