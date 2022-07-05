//
//  AuthViewController.swift
//  SCBMonitorSwift
//
//  Created by ANTON DOBRYNIN on 04.07.2022.
//

import UIKit

final class AuthViewController: UIViewController {
    
    weak var authScreenFlowCoordinatorHandler: AuthScreenFlowCoordinatorHandler?

    private let defaultButton: DefaultButton = {
        let button = DefaultButton()
        button.setTitle("Логин", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view.backgroundColor = MColors.white
        
        // For example UI
        defaultButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        view.addSubview(defaultButton)
        NSLayoutConstraint.activate([
            defaultButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            defaultButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            defaultButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: defaultButton.rightAnchor, constant: 16)
        ])
    }
    
    // MARK: - Objc
    @objc func buttonDidTap() {
        // after business logic
        authScreenFlowCoordinatorHandler?.didSuccessLogin()
    }
}
