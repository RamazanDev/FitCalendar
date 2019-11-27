//
//  Configurable.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 27.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//
import UIKit

protocol Configurable {
    associatedtype Model
    func configure(with model: Model)
}

protocol CellConfigurator {
    static var reuseId: String { get }
    func configure(cell: UIView)
}

