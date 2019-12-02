//
//  KeyValue.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 29.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

final class KeyValue {
    
    // MARK: - Private properties
    
    private var key: String
    private var value: Any
    
    // MARK: - Init
    
    init(key: String, value: Any) {
        self.key = key
        self.value = value
    }
    
    // MARK: - Getters
    
    func getKey() -> String {
        return key
    }
    
    func getValue() -> Any {
        return value
    }
    
    // MARK: - Setters
    
    func setKey(_ key: String) {
        self.key = key
    }
    
    func setValue(_ value: Any) {
        self.value = value
    }
    
    
    
}
