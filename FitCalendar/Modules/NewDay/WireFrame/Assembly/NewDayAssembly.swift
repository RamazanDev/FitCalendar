//
//  NewDayAssembly.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class NewDayAssembly {
    static func assembly() -> UIViewController {
        let view = NewDayVC()
        
        let router = NewDayRouter(transition: view)
        let dataConverter = NewDayDataConverter()
        let presenter = NewDayPresenter(dataProvider: dataConverter,
                                         router: router)
        
        view.presenter = presenter
        presenter.view = view
        

        
        return view
    }
}
