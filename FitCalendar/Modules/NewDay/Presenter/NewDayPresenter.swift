//
//  NewDayPresenter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

final class NewDayPresenter {
    
    // MARK: - Public properties
    
    weak var view: NewDayViewInput?
    
    // MARK: - Private properties
    
    private let dataProvider: NewDayDataConverterInput
    private let router: NewDayRouterInput
    
    // MARK: - Init
    
    init(dataProvider: NewDayDataConverterInput, router: NewDayRouterInput) {
        self.dataProvider = dataProvider
        self.router = router
    }
}

// MARK: - ProfileViewOutput

extension NewDayPresenter: NewDayViewOutput {
    func viewIsReady() {
        let viewModel = dataProvider.createView()
        view?.setup(viewModel: viewModel)
    }
    
    func didSelectRow(type: NewDayViewModel.Row) {
        switch type {
        default:
            break
        }
    }
}
