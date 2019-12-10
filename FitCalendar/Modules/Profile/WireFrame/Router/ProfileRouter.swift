//
//  ProfileRouter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class ProfileRouter {
    
    // MARK: - Private properties
    
    private weak var transition: UIViewController?
    
    // MARK: - Init
    
    init(transition: UIViewController) {
        self.transition = transition
    }
    
}

// MARK: - ProfileRouterInput

extension ProfileRouter: ProfileRouterInput {
    func openMuscleGroupsModule() {
        let vc = MuscleGroupsAssembly.assembly()
        transition?.navigationController?.pushViewController(vc, animated: true)
    }
    
}
