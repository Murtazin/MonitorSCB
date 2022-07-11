//
//  EmployeesPersonalDataHeaderView.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 11.07.2022.
//

import UIKit

class EmployeesPersonalDataHeaderView: UIView {
    
    // MARK: - Private properties
    private lazy var employeeImageView: UIImageView = {
        let employeeImageView = UIImageView()
        employeeImageView.image = UIImage(named: "userMock-icon")
        return employeeImageView
    }()
    
    private lazy var employeeFullNameLabel: UILabel = {
        let employeeFullNameLabel = UILabel()
        employeeFullNameLabel.textColor = MColors.mineShaft
        employeeFullNameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        employeeFullNameLabel.text = "Татьяна Сидорова"
        return employeeFullNameLabel
    }()
    
    private lazy var employeeJobTitleLabel: UILabel = {
        let employeeJobTitleLabel = UILabel()
        employeeJobTitleLabel.textColor = MColors.maco
        employeeJobTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        employeeJobTitleLabel.text = "UX/UI Designer"
        return employeeJobTitleLabel
    }()
    
    // MARK: - View life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension EmployeesPersonalDataHeaderView {
    func setUpUserInterface() {
        backgroundColor = UIColor(cgColor: MColors.selago)
        
        employeeImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(employeeImageView)
        NSLayoutConstraint.activate([
            employeeImageView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            employeeImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            employeeImageView.heightAnchor.constraint(equalToConstant: 80),
            employeeImageView.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        employeeFullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(employeeFullNameLabel)
        NSLayoutConstraint.activate([
            employeeFullNameLabel.topAnchor.constraint(equalTo: employeeImageView.bottomAnchor, constant: 20),
            employeeFullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        employeeJobTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(employeeJobTitleLabel)
        NSLayoutConstraint.activate([
            employeeJobTitleLabel.topAnchor.constraint(equalTo: employeeFullNameLabel.bottomAnchor, constant: 16),
            employeeJobTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
