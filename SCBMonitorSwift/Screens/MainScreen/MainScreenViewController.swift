//
//  MainScreenViewController.swift
//  SCBMonitorSwift
//
//  Created by ANTON DOBRYNIN on 05.07.2022.
//

import UIKit

final class MainScreenViewController: UIViewController {
    
    weak var mainScreenCoordinatorHandler: MainScreenFlowCoordinatorHandler?
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Авторизация"
        view.backgroundColor = MColors.white
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
}
