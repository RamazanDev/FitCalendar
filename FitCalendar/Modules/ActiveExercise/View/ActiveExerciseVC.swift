//
//  ActiveExerciseVC.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 29.11.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class ActiveExerciseVC: UIViewController {
    
    // MARK: - VIews
    
    private var tableView: UITableView!
    private var exerciseCreateView: UIView!
    private var countView: UIView!
    private var weightView: UIView!
    private var countLabel: UILabel!
    private var weightLabel: UILabel!
    private var addRepetButton: UIButton!
    
    // MARK: - Public properties
    
    var dataSource: ActiveExerciseTableDataSource?
    var presenter: ActiveExerciseViewOutput?
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupExerciseCreateView()
        setupRepetTableView()
        setupWeightView()
        setupCountView()
        setupAddRepetButton()
        presenter?.viewIsReady()
    }
    
    // MARK: - Setup view funcs
    
    private func setupView() {
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupExerciseCreateView() {
        exerciseCreateView = UIView(frame: .zero)
        exerciseCreateView.backgroundColor = .black
        
        self.view.addSubview(exerciseCreateView)
        
        exerciseCreateView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(self.navigationController!.navigationBar.frame.height)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(300)
        }
    }
    
    private func setupWeightView() {
        weightView = UIView(frame: .zero)
        weightView.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
        weightView.corner(angle: 50)
        weightView.layer.borderWidth = 0.5
        weightView.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.6078431373, alpha: 1)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(weightClicked))
        tap.numberOfTapsRequired = 1
        weightView.addGestureRecognizer(tap)
        
        self.exerciseCreateView.addSubview(weightView)
        
        weightView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(32)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        setupWeightTitleLabel()
        setupWeightLabel()
        
    }
    
    
    private func setupWeightLabel() {
        weightLabel = UILabel(frame: .zero)
        weightLabel.textColor = .white
        weightLabel.text = "300 кг"
        weightLabel.font = weightLabel.font.withSize(18)
        
        weightView.addSubview(weightLabel)
        
        weightLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
    private func setupCountView() {
        countView = UIView(frame: .zero)
        countView.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
        
        countView.corner(angle: 50)
        countView.layer.borderWidth = 0.5
        countView.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.6078431373, alpha: 1)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(countClicked))
        tap.numberOfTapsRequired = 1
        countView.addGestureRecognizer(tap)
        
        self.exerciseCreateView.addSubview(countView)
        
        countView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(60)
            make.right.equalToSuperview().offset(-32)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        setupCountTitleLabel()
        setupCountLabel()
    }
    
    private func setupCountLabel() {
        countLabel = UILabel(frame: .zero)
        countLabel.textColor = .white
        countLabel.text = "12"
        countLabel.font = weightLabel.font.withSize(18)
        
        countView.addSubview(countLabel)
        
        countLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        
    }
    
    private func setupWeightTitleLabel() {
        let label = UILabel(frame: .zero)
        label.text = "Вес"
        label.font = label.font.withSize(14)
        label.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        exerciseCreateView.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.bottom.equalTo(weightView.snp.top).offset(-12)
            make.centerX.equalTo(weightView)
        }
    }
    
    private func setupCountTitleLabel() {
        let label = UILabel(frame: .zero)
        label.text = "Количество"
        label.font = label.font.withSize(14)
        label.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        
        exerciseCreateView.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.bottom.equalTo(countView.snp.top).offset(-12)
            make.centerX.equalTo(countView)
        }
    }
    
    
    private func setupAddRepetButton() {
        addRepetButton = UIButton(frame: .zero)
        addRepetButton.backgroundColor = .clear
        addRepetButton.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.6078431373, alpha: 1)
        addRepetButton.layer.borderWidth = 0.5
        addRepetButton.setTitle("Закончить повторение", for: .normal)
        addRepetButton.setTitleColor(#colorLiteral(red: 0, green: 1, blue: 0.6078431373, alpha: 1), for: .normal)
        addRepetButton.titleLabel?.font = addRepetButton.titleLabel?.font.withSize(16)
        addRepetButton.addTarget(self, action: #selector(addReppetButtonIsClicked), for: .touchUpInside)
        addRepetButton.corner(angle: 8)
        
        exerciseCreateView.addSubview(addRepetButton)
        
        addRepetButton.snp.makeConstraints { (make) in
            make.height.equalTo(48)
            make.width.equalTo(216)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-16)
        }
        
    }
    
    private func setupRepetTableView() {
        tableView = UITableView(frame: .zero)
        self.view.addSubview(tableView)
        
        tableView.backgroundColor = .clear
        tableView.register(KeyValueCell.self, forCellReuseIdentifier: "KeyValueCell")
        dataSource?.tableView = tableView
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(exerciseCreateView.snp.bottom)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.left.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    
    @objc private func addReppetButtonIsClicked(_ sender: UIButton) {
        presenter?.addRepetition(weight: (weightLabel.text!.digits as NSString).floatValue, count: Int(countLabel.text!)!)
    }
    
    @objc private func weightClicked() {
        presenter?.weightIsClicked()
    }
    
    @objc private func countClicked() {
        presenter?.countIsClicked()
    }
    
}

// MARK: - ActiveExerciseViewInput

extension ActiveExerciseVC: ActiveExerciseViewInput {
    func setTitleView(_ title: String) {
        self.title = title
    }

    func setCount(count: Int) {
        countLabel.text = count.description
    }
    
    func setWeight(weight: Float) {
        weightLabel.text = "\(weight.preparingForShowIntOrFloatDescription()) кг"
    }
    
}
