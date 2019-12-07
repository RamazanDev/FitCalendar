//
//  PickerVC.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 07.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class PickerVC: UIViewController {
    
    // MARK: - Views
    
    private var backgroundView: UIView!
    private var picker: UIPickerView!
    private var saveButton: UIButton!
    private var titleLabel: UILabel!
    
    // MARK: - Private properties
    
    private var delegate: PickerOutput?
    private var dataArray: [String] = []
    private var effectView = UIVisualEffectView()
    private var type: PickerContentType!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        moveIn()
        setupView()
        setupBackgroundView()
    }
    
    // MARK: - Public func for config
    
    func setup(delegate: PickerOutput, dataArray: [String], type: PickerContentType) {
        self.delegate = delegate
        self.dataArray = dataArray
        self.type = type
    }
    
    // MARK: - Navigation animations
    
    private func moveIn() {
        self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
        self.view.alpha = 0.0
        
        UIView.animate(withDuration: 0.24) {
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.view.alpha = 1.0
            self.effectView.alpha = 0.8
        }
    }
    
    private func moveOut() {
        UIView.animate(withDuration: 0.24, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.35, y: 1.35)
            self.effectView.alpha = 0.0
            self.view.alpha = 0.0
        }) { _ in
            self.view.removeFromSuperview()
        }
        
    }
    
    // MARK: - Setup Views
    
    private func setupView() {
        self.view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: .dark)
        
        effectView = UIVisualEffectView(effect: blurEffect)
        
        effectView.frame = self.view.frame
        self.view.addSubview(effectView)
    }
    
    private func setupBackgroundView() {
        backgroundView = UIView(frame: .zero)
        backgroundView.backgroundColor = .black
        backgroundView.corner(backgroundView, angle: 16)
        self.view.addSubview(backgroundView)
        
        backgroundView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalTo(450)
            make.width.equalTo(300)
        }
        
        setupTitleLabel()
        setupSaveButton()
        setupPicker()

    }
    
    private func setupTitleLabel() {
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = titleLabel.font.withSize(12)
        titleLabel.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
        titleLabel.text = type.rawValue
        
        backgroundView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(12)
            
        }
    }
    
    private func setupPicker() {
        picker = UIPickerView(frame: .zero)
        picker.dataSource = self
        picker.delegate = self
        picker.backgroundColor = .clear
        picker.tintColor = .white
        picker.selectRow(dataArray.count / 2, inComponent: 0, animated: true)
        
        backgroundView.addSubview(picker)
        
        picker.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalTo(saveButton.snp.top).offset(-16)
        }
        
    }
    
    private func setupSaveButton() {
        saveButton = UIButton(frame: .zero)
        saveButton.backgroundColor = .clear
        saveButton.layer.borderColor = #colorLiteral(red: 0, green: 1, blue: 0.6078431373, alpha: 1)
        saveButton.layer.borderWidth = 0.5
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.setTitleColor(#colorLiteral(red: 0, green: 1, blue: 0.6078431373, alpha: 1), for: .normal)
        saveButton.titleLabel?.font = saveButton.titleLabel?.font.withSize(16)
        saveButton.addTarget(self, action: #selector(saveButtonIsClicked), for: .touchUpInside)
        backgroundView.corner(saveButton, angle: 8)
        
        backgroundView.addSubview(saveButton)
        
        saveButton.snp.makeConstraints { (make) in
            make.height.equalTo(36)
            make.width.equalTo(124)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-12)
        }
        
    }
    
    
    // MARK: - Actions
    
    @objc private func saveButtonIsClicked(_ sender: UIButton) {
        delegate?.saveButtonIsClicked(with: dataArray[picker.selectedRow(inComponent: 0)], type: self.type)
        moveOut()
    }
    
}

// MARK: - UIPickerViewDelegate

extension PickerVC: UIPickerViewDelegate {
    
}

// MARK: - UIPickerViewDataSource

extension PickerVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dataArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = dataArray[row]
        
        return row
    }
    
}
