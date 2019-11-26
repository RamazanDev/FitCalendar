//
//  ExerciseModel.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 26.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import RealmSwift

final class ExerciseModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var result: ExerciseReppetitionModel?
}

final class ExrciceResultModel: Object {
    @objc dynamic var date = Date()
    var repetitions = List<ExerciseReppetitionModel>()
}

final class ExerciseReppetitionModel: Object {
    @objc dynamic var phase: Int = 0
    @objc dynamic var count: Int = 0
    @objc dynamic var weight: Float = 0.0
}
