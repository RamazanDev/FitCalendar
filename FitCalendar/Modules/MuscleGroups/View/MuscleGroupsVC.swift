//
//  MuscleGroupsVC.swift
//  FitCalendar
//
//  Created by Магомедов Рамазан on 09.12.2019.
//  Copyright © 2019 Магомедов Рамазан. All rights reserved.
//

import UIKit

final class MuscleGroupsVC: UIViewController {
    
    // MARK: - Views
    
    private var collectionView: UICollectionView!
    
    // MARK: - Public properties
    
    var presenter: MuscleGroupsOutput?
    
    // MARK: - Private properties
    
    private var groups: [MuscleGroupModel] = []
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
        presenter?.viewIsReady()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navBar = navigationController?.navigationBar
        navBar?.prefersLargeTitles = false
    }
    
    // MARK: - Setup view funcs
    
    private func setupView() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(dismissView))
        self.title = "Выберите мышечную группу"
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MuscleGroupCell.self, forCellWithReuseIdentifier: "MuscleGroupCell")
        
        self.view.addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
    }
    
    // MARK: - Actions
    
    @objc private func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

// MARK: - UICollectionViewDelegate

extension MuscleGroupsVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectRow(index: indexPath.row)
    }
    
}

// MARK: - UICollectionViewDataSource

extension MuscleGroupsVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MuscleGroupCell", for: indexPath) as? MuscleGroupCell else { return UICollectionViewCell()}
        let group = groups[indexPath.row]
        
        cell.configure(with: MuscleGroupCell.Model(image: group.image, name: group.name))
        
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MuscleGroupsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = (self.view.frame.width)/2.3
        
        return CGSize(width: w, height: w)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
}

// MARK: - MuscleGroupsInput

extension MuscleGroupsVC: MuscleGroupsInput {
    func setup(groups: [MuscleGroupModel]) {
        self.groups = groups
        collectionView.reloadData()
    }
    
    func openExercisesModule(model: MuscleGroupModel) {
        let vc = MuscleGroupExercisesAssembly.assembly(model: model)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
