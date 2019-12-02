//
//  ExerciseModel.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 26.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import RealmSwift

final class ExerciseModel: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var result: ExrciceResultModel? = nil
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

final class ExrciceResultModel: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var date = Date()
    var repetitions = List<ExerciseRepetitionModel>()
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

final class ExerciseRepetitionModel: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var phase: Int = 0
    @objc dynamic var count: Int = 0
    @objc dynamic var weight: Float = 0.0
    
    func convertToKeyValue() -> KeyValue {
        let key = "\(phase). \(count)"

        return KeyValue(key: key, value: weight.description)
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
