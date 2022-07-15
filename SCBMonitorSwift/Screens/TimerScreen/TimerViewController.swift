//
//  TimerViewController.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 14.07.2022.
//

import UIKit

class TimerViewController: UIViewController {
    
    // MARK: - Private properties
    private var isTimerStarted = false
    
    private lazy var startButton: UIButton = {
        let startButton = UIButton()
        startButton.setTitle("СТАРТ", for: .normal)
        startButton.setImage(UIImage(named: "play-icon"), for: .normal)
        startButton.backgroundColor = MColors.dodgerBlue
        startButton.tintColor = MColors.white
        return startButton
    }()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        setupUI()
        setupTimerView()
    }
}

// MARK: - Private
private extension TimerViewController {
    func setupUI() {
        
        startButton.layer.cornerRadius = 25
        startButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
        startButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)
        
        startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: 50),
            startButton.widthAnchor.constraint(equalToConstant: 180),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 140),
            view.centerXAnchor.constraint(equalTo: startButton.centerXAnchor)
        ])
    }
    
    func setupTimerView() {
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: view.frame.midX, y: view.frame.midY - 60), radius: 110, startAngle: 0, endAngle: .pi * 2, clockwise: true)
        let shape = CAShapeLayer()
        shape.path = circlePath.cgPath
        shape.lineWidth = 30
        shape.strokeColor = MColors.selago
        shape.fillColor = MColors.white.cgColor
        view.layer.addSublayer(shape)
    }
    
    func configureButton() {
        let image = isTimerStarted ? UIImage(named: "pause-icon") : UIImage(named: "play-icon")
        let backgroundColor = isTimerStarted ? MColors.spray : MColors.dodgerBlue
        let title = isTimerStarted ? "СТОП" : "СТАРТ"
        startButton.setImage(image, for: .normal)
        startButton.backgroundColor = backgroundColor
        startButton.setTitle(title, for: .normal)
    }
    
    // MARK: - Objc
    @objc func startButtonPressed() {
        configureButton()
        isTimerStarted.toggle()
    }
}
