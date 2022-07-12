//
//  EmployeesCustomTableViewCell.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 12.07.2022.
//

import UIKit

final class EmployeesCustomTableViewCell: UITableViewCell {
    
    static let reuseIdentitfier = "employeesCustomTableViewCell"
    
    // MARK: - Private properties
    private lazy var containterView: UIView = {
        let containerView = UIView()
        containerView.layer.borderColor = MColors.selago
        containerView.layer.borderWidth = 2
        containerView.layer.cornerRadius = 10
        return containerView
    }()
    
    private lazy var employeeImageView: UIImageView = {
        let employeeImageView = UIImageView()
        employeeImageView.image = UIImage(named: "image")
        return employeeImageView
    }()
    
    private lazy var employeeFullNameLabel: UILabel = {
        let employeeFullNameLabel = UILabel()
        employeeFullNameLabel.text = "Text"
        return employeeFullNameLabel
    }()
    
    private lazy var employeeProjectLabel: UILabel = {
        let employeeProjectLabel = UILabel()
        employeeProjectLabel.text = "project"
        return employeeProjectLabel
    }()
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private
private extension EmployeesCustomTableViewCell {
    func setUpContentView() {
        
        containterView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(containterView)
        NSLayoutConstraint.activate([
            containterView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containterView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: containterView.bottomAnchor, constant: 8),
            contentView.rightAnchor.constraint(equalTo: containterView.rightAnchor, constant: 16)
        ])
        
        employeeImageView.translatesAutoresizingMaskIntoConstraints = false
        containterView.addSubview(employeeImageView)
        NSLayoutConstraint.activate([
            employeeImageView.topAnchor.constraint(equalTo: containterView.topAnchor, constant: 12),
            employeeImageView.leftAnchor.constraint(equalTo: containterView.leftAnchor, constant: 28),
            containterView.bottomAnchor.constraint(equalTo: employeeImageView.bottomAnchor, constant: 12)
        ])

        employeeFullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        containterView.addSubview(employeeFullNameLabel)
        NSLayoutConstraint.activate([
            employeeFullNameLabel.topAnchor.constraint(equalTo: employeeImageView.topAnchor, constant: 4),
            employeeFullNameLabel.leftAnchor.constraint(equalTo: employeeImageView.rightAnchor, constant: 28)
        ])

        employeeProjectLabel.translatesAutoresizingMaskIntoConstraints = false
        containterView.addSubview(employeeProjectLabel)
        NSLayoutConstraint.activate([
            employeeProjectLabel.topAnchor.constraint(equalTo: employeeFullNameLabel.bottomAnchor, constant: 12),
            employeeProjectLabel.leftAnchor.constraint(equalTo: employeeImageView.rightAnchor, constant: 28)
        ])
    }
}
