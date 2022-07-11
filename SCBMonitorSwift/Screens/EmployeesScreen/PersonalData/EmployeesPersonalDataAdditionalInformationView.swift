//
//  EmployeesPersonalDataAdditionalInformationView.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 11.07.2022.
//

import UIKit

class EmployeesPersonalDataAdditionalInformationView: UIView {

    // MARK: - Private properties
    private lazy var birthdayInformationView: EmployeeCustomInformationView = {
        let birthdayInformationView = EmployeeCustomInformationView()
        return birthdayInformationView
    }()
    
    private lazy var phoneNumberInformationView: EmployeeCustomInformationView = {
        let phoneNumberInformationView = EmployeeCustomInformationView()
        return phoneNumberInformationView
    }()
    
    private lazy var skillsInformationView: EmployeeCustomInformationView = {
        let skillsInformationView = EmployeeCustomInformationView()
        return skillsInformationView
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

private extension EmployeesPersonalDataAdditionalInformationView {
    func setUpUserInterface() {
        backgroundColor = .systemBackground
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        birthdayInformationView.configure(by: EmployeeInformationModel(image: UIImage(named: "phone"), title: "Phone number", description: "+7900909090"))
        birthdayInformationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(birthdayInformationView)
        NSLayoutConstraint.activate([
            birthdayInformationView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            birthdayInformationView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            rightAnchor.constraint(equalTo: birthdayInformationView.rightAnchor, constant: 16),
            birthdayInformationView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        phoneNumberInformationView.configure(by: EmployeeInformationModel(image: UIImage(named: "cake"), title: "Birtday date", description: "28.06.2000"))
        phoneNumberInformationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(phoneNumberInformationView)
        NSLayoutConstraint.activate([
            phoneNumberInformationView.topAnchor.constraint(equalTo: birthdayInformationView.bottomAnchor, constant: 16),
            phoneNumberInformationView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            rightAnchor.constraint(equalTo: phoneNumberInformationView.rightAnchor, constant: 16),
            phoneNumberInformationView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        skillsInformationView.configure(by: EmployeeInformationModel(image: UIImage(named: "suitcase"), title: "Skills", description: "Figma, Sketch, Photoshop"))
        skillsInformationView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(skillsInformationView)
        NSLayoutConstraint.activate([
            skillsInformationView.topAnchor.constraint(equalTo: phoneNumberInformationView.bottomAnchor, constant: 16),
            skillsInformationView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            rightAnchor.constraint(equalTo: skillsInformationView.rightAnchor, constant: 16),
            skillsInformationView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
