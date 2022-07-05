//
//  MainScreenViewController.swift
//  SCBMonitorSwift
//
//  Created by ANTON DOBRYNIN on 05.07.2022.
//

import UIKit

final class MainScreenViewController: UIViewController {
    
    weak var mainScreenCoordinatorHandler: MainScreenFlowCoordinatorHandler?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
    }
}
