//
//  ProfilePresenter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

final class ProfilePresenter {
    
    // MARK: - Public properties
    
    weak var view: ProfileViewInput?
    
    // MARK: - Private properties
    
    private let dataProvider: ProfileDataConverterInput
    private let router: ProfileRouterInput
    
    // MARK: - Init
    
    init(dataProvider: ProfileDataConverterInput, router: ProfileRouterInput) {
        self.dataProvider = dataProvider
        self.router = router
    }
}

// MARK: - ProfileViewOutput

extension ProfilePresenter: ProfileViewOutput {
    func viewIsReady() {
        let viewModel = dataProvider.createView()
        view?.setup(viewModel: viewModel)
    }
    
    func didSelectRow(type: ProfileViewModel.Row) {
        switch type {
        default:
            break
        }
    }
}
