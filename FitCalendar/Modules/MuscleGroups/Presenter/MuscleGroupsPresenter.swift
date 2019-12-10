//
//  MuscleGroupsPresenter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 09.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

final class MuscleGroupsPresenter {
    
    // MARK: - Public properties
    
    weak var view: MuscleGroupsInput?
    
    // MARK: - Private properties
    
    private var groups: [MuscleGroupModel] = []
    private let resourcesFactory: ResourcesFactory
    
    // MARK: - Init
    
    init(resourcesFactory: ResourcesFactory) {
        self.resourcesFactory = resourcesFactory
    }
    
}

// MARK: - MuscleGroupsOutput

extension MuscleGroupsPresenter: MuscleGroupsOutput {
    func viewIsReady() {
        self.groups = resourcesFactory.muscleGroups
        
        view?.setup(groups: self.groups)
    }
    
    func didSelectRow(index: Int) {
        view?.openExercisesModule(title: groups[index].name)
    }
    
}
