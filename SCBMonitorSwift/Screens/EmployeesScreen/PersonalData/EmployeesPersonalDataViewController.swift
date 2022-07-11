//
//  EmployeesPersonalDataViewController.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 11.07.2022.
//

import UIKit

class EmployeesPersonalDataViewController: UIViewController {
    
    // MARK: - Private properties
    private lazy var headerView: EmployeesPersonalDataHeaderView = {
        let headerView = EmployeesPersonalDataHeaderView()
        return headerView
    }()
    
    private lazy var additionalInformationView: EmployeesPersonalDataAdditionalInformationView = {
        let additionalInformationView = EmployeesPersonalDataAdditionalInformationView()
        return additionalInformationView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserInterface()
    }
}

private extension EmployeesPersonalDataViewController {
    func setUpUserInterface() {
        view.backgroundColor = .systemBackground
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.leftAnchor.constraint(equalTo: view.leftAnchor),
            headerView.rightAnchor.constraint(equalTo: view.rightAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 280)
        ])
        
        additionalInformationView.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
