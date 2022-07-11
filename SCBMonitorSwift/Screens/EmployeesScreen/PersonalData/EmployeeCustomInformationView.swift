//
//  EmployeeCustomInformationView.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 11.07.2022.
//

import UIKit

class EmployeeCustomInformationView: UIView {
    
    // MARK: - Private properties
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "phone")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var textView: UITextView = {
        let textView = UITextView()
//        textView.text = "+79747686272"
        textView.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textView.textColor = MColors.maco
        textView.textAlignment = .left
        return textView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
//        titleLabel.text = "Phone number"
        titleLabel.textColor = MColors.osloGray
        titleLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return titleLabel
    }()
    
    // MARK: - View life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUserInterface()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(by model: EmployeeInformationModel) {
        imageView.image = model.image
        titleLabel.text = model.title
        textView.text = model.description
    }
}

private extension EmployeeCustomInformationView {
    func setUpUserInterface() {
        backgroundColor = .systemBackground
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 10),
            titleLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16)
        ])
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(textView)
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            textView.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 16),
            bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8),
            rightAnchor.constraint(equalTo: textView.rightAnchor, constant: 16)
        ])
    }
}
