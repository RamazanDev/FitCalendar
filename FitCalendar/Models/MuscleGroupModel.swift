//
//  MuscleGroupModel.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 09.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class MuscleGroupModel {
    let id: String
    let image: UIImage
    let name: String
    
    init(id: String, image: UIImage, name: String) {
        self.id = id
        self.image = image
        self.name = name
    }
}
