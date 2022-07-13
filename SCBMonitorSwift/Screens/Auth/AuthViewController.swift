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
        loginTextField.attributedPlaceholder = NSAttributedString(
            string: "Логин",
            attributes: [NSAttributedString.Key.foregroundColor: MColors.osloGray]
        )
        return loginTextField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [NSAttributedString.Key.foregroundColor: MColors.osloGray]
        )
        return passwordTextField
    }()
    
    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.setTitle("Войти", for: .normal)
        loginButton.backgroundColor = MColors.spray
        loginButton.tintColor = MColors.white
        return loginButton
    }()
    
    private lazy var hidePasswordButton: UIButton = {
        let hidePasswordButton = UIButton(type: .custom)
        hidePasswordButton.setImage(UIImage(named: "hidePassword-icon"), for: .normal)
        hidePasswordButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -50, bottom: 0, right: 0)
        return hidePasswordButton
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil);
        
        view.backgroundColor = .systemBackground
        
        setupUI()
    }
    
    @objc func keyboardWillShow(sender: NSNotification) {
         self.view.frame.origin.y = -150
    }

    @objc func keyboardWillHide(sender: NSNotification) {
         self.view.frame.origin.y = 0
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
        
        loginTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        loginTextField.layer.borderWidth = 1.0
        loginTextField.layer.borderColor = MColors.selago
        loginTextField.layer.cornerRadius = 15
        
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginTextField)
        NSLayoutConstraint.activate([
            loginTextField.heightAnchor.constraint(equalToConstant: 40),
            loginTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 50),
            loginTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: loginTextField.rightAnchor, constant: 16)
        ])
        
        passwordTextField.rightViewMode = .always
        passwordTextField.rightView = hidePasswordButton
        passwordTextField.layer.sublayerTransform = CATransform3DMakeTranslation(15, 0, 0)
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = MColors.selago
        passwordTextField.layer.cornerRadius = 15
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 16),
            passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: passwordTextField.rightAnchor, constant: 16)
        ])
        
        loginButton.layer.cornerRadius = 25
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loginButton)
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: loginButton.rightAnchor, constant: 16)
        ])
    }
}
