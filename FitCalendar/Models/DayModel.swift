//
//  DayModel.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 26.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import RealmSwift

final class DayModel: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var date = Date()
    var exercises = List<ExerciseModel>()
    
    convenience init(date: Date, exercises: List<ExerciseModel>?) {
        self.init()
        self.date = date
        
        if exercises != nil {
        self.exercises = exercises!
        }
        
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
