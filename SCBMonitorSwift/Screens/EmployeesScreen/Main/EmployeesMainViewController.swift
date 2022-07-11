//
//  EmployeesMainViewController.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 11.07.2022.
//

import UIKit

class EmployeesMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserInterface()
    }
}

private extension EmployeesMainViewController {
    func setUpUserInterface() {
        title = "Сотрудники"
        view.backgroundColor = .systemBackground
    }
}
