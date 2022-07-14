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
    private let notifButton: DefaultButton = {
        let button = DefaultButton()
        button.setTitle("Уведомления", for: .normal)
        return button
    }()
    private let guideButton: DefaultButton = {
        let button = DefaultButton()
        button.setTitle("Инф. для новичков", for: .normal)
        return button
    }()
    private let personalProfileButton: DefaultButton = {
        let button = DefaultButton()
        button.setTitle("Личный кабинет", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = MColors.white
        
        // For example UI
        setupButtons()
    }
    
    // MARK: - Objc
    @objc func buttonDidTap() {
        // after business logic
        authScreenFlowCoordinatorHandler?.didSuccessLogin()
    }
    @objc func notifDidTap() {
        authScreenFlowCoordinatorHandler?.openNotif()
    }
    @objc func guideDidTap() {
        authScreenFlowCoordinatorHandler?.openGuide()
    }
    @objc func personalPageDidTap() {
        authScreenFlowCoordinatorHandler?.openPersonalPage()
    }
    
    // MARK: - Setup Buttons
    func setupButtons() {
        defaultButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        view.addSubview(defaultButton)
        NSLayoutConstraint.activate([
            defaultButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            defaultButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            defaultButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: defaultButton.rightAnchor, constant: 16)
        ])
        
        notifButton.addTarget(self, action: #selector(notifDidTap), for: .touchUpInside)
        view.addSubview(notifButton)
        NSLayoutConstraint.activate([
            notifButton.topAnchor.constraint(equalTo: defaultButton.bottomAnchor, constant: 20),
            notifButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: notifButton.rightAnchor, constant: 16)
        ])
        
        guideButton.addTarget(self, action: #selector(guideDidTap), for: .touchUpInside)
        view.addSubview(guideButton)
        NSLayoutConstraint.activate([
            guideButton.topAnchor.constraint(equalTo: notifButton.bottomAnchor, constant: 20),
            guideButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: guideButton.rightAnchor, constant: 16)
        ])
        personalProfileButton.addTarget(self, action: #selector(personalPageDidTap), for: .touchUpInside)
        view.addSubview(personalProfileButton)
        NSLayoutConstraint.activate([
            personalProfileButton.topAnchor.constraint(equalTo: guideButton.bottomAnchor, constant: 20),
            personalProfileButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: personalProfileButton.rightAnchor, constant: 16)
        ])
    }
}
