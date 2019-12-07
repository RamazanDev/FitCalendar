//
//  ActiveExerciseRouter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 07.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class ActiveExerciseRouter {
    
    // MARK: - Private properties
    
    private weak var transition: UIViewController?
    
    // MARK: - Init
    
    init(transition: UIViewController) {
        self.transition = transition
    }
    
}

// MARK: - MainCalendarRouterInput

extension ActiveExerciseRouter: ActiveExerciseRouterInput {
    func showPickerPopUp(delegate: PickerOutput, dataArray: [String], type: PickerContentType) {
        
        let popUpVC = PickerVC()
        popUpVC.setup(delegate: delegate, dataArray: dataArray, type: type)
        transition!.addChild(popUpVC)
        popUpVC.view.frame = transition!.view.frame
        transition!.view.addSubview(popUpVC.view)
        transition!.tabBarController?.tabBar.alpha = 0.6
        transition!.tabBarController?.tabBar.isUserInteractionEnabled = false
        popUpVC.didMove(toParent: transition)
        
    }
    
}
