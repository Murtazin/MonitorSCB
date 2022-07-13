//
//  AuthViewController.swift
//  SCBMonitorSwift
//
//  Created by ANTON DOBRYNIN on 04.07.2022.
//

import UIKit

final class AuthViewController: UIViewController {
    
    weak var authScreenFlowCoordinatorHandler: AuthScreenFlowCoordinatorHandler?
    
    // MARK: - Private properties
    private lazy var topImageView: UIImageView = {
        let topImageView = UIImageView()
        topImageView.image = UIImage(named: "picture")
        return topImageView
    }()
    
    private lazy var welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.numberOfLines = 2
        welcomeLabel.text = "Добро пожаловать \n \t в SCB Monitor!"
        welcomeLabel.textColor = MColors.mineShaft
        welcomeLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return welcomeLabel
    }()
    
    private lazy var loginTextField: UITextField = {
        let loginTextField = UITextField()
        loginTextField.placeholder = "Логин"
        loginTextField.layer.borderWidth = 1.0
//        loginTextField.layer.borderColor = MColors.osloGray
        return loginTextField
    }()
    
    private lazy var passwordTextFiled: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Пароль"
        passwordTextField.rightViewMode = .always
        passwordTextField.rightView = UIImageView(image: UIImage(named: "hidePassword-icon"))
        return passwordTextField
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Войти", for: .normal)
        loginButton.backgroundColor = MColors.spray
        loginButton.tintColor = MColors.white
        return loginButton
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
}

// MARK: - Private
private extension AuthViewController {
    func setupUI() {
        
        topImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topImageView)
        NSLayoutConstraint.activate([
            topImageView.topAnchor.constraint(equalTo: view.topAnchor),
            topImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.rightAnchor.constraint(equalTo: topImageView.rightAnchor)
        ])
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(welcomeLabel)
        NSLayoutConstraint.activate([
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextField)
        NSLayoutConstraint.activate([
            loginTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            loginTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: loginTextField.rightAnchor, constant: 16)
        ])
    }
}
