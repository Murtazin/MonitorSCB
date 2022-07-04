//
//  ViewController.swift
//  SCBMonitorSwift
//
//  Created by ANTON DOBRYNIN on 04.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let defaultButton: DefaultButton = {
        let button = DefaultButton()
        button.setTitle("Старт", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
            
        //For example UI 
        view.addSubview(defaultButton)
        NSLayoutConstraint.activate([
            defaultButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            defaultButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            defaultButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            view.rightAnchor.constraint(equalTo: defaultButton.rightAnchor, constant: 16)
        ])
    }
}

