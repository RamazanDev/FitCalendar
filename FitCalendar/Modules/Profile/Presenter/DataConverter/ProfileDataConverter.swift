//
//  ProfileDataConverter.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 28.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

final class ProfileDataConverter: ProfileDataConverterInput {
    
    typealias textWithArrowCellConfig = TableCellConfigurator<TextWithArrowCell, TextWithArrowCell.Model>
    typealias separatorCellConfig = TableCellConfigurator<SeparatorTableViewCell, SeparatorTableViewCell.Model>
    typealias userInfoCellConfig = TableCellConfigurator<ProfileUserInfoCell, ProfileUserInfoCell.Model>
    
    func createView() -> ProfileViewModel {
        var rows: [ProfileViewModel.Row] = []
        
        rows.append(.userInfo(userInfoCellConfig(item:
            ProfileUserInfoCell.Model(image: #imageLiteral(resourceName: "photoPlaceholder"),
                                      name: "Рамазан",
                                      lastTrainingTime: "Последняя тренировка:\n9 декабря"))))
        
        rows.append(.separator(separatorCellConfig(item: SeparatorTableViewCell.Model())))
        
        rows.append(.parametersOfBody(textWithArrowCellConfig(item: "Параметры тела")))
        rows.append(.statisticsOfVisitings(textWithArrowCellConfig(item: "Статистика посещений")))
        rows.append(.records(textWithArrowCellConfig(item: "Личные рекорды")))
        
        rows.append(.separator(separatorCellConfig(item: SeparatorTableViewCell.Model())))
        
        rows.append(.allExercises(textWithArrowCellConfig(item: "Все упражнения")))
        

        
        rows.append(.separator(separatorCellConfig(item: SeparatorTableViewCell.Model())))
        rows.append(.settings(textWithArrowCellConfig(item: "Настройки")))
        
        
        return ProfileViewModel(rows: rows)
    }
}
