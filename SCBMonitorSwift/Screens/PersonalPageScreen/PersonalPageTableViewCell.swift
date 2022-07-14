//
//  PersonalPageTableViewCell.swift
//  SCBMonitorSwift
//
//  Created by Тимофей Борисов on 13.07.2022.
//

import UIKit

final class PersonalDataCell: UITableViewCell {
    
    // MARK: - Private properties
    private var cellId = Int()
    
    private var conteiner: UIView = {
        let view = UIView()
        return view
    }()
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        label.numberOfLines = 1
        return label
    }()
    private var bodyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    private var editButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "editInfo-icon"), for: .normal)
        return btn
    }()
    
    // MARK: - Life cycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(_ model: PDModel) {
        switch model.type {
        case .one:
            titleLabel.text = "Дата рождения"
            bodyLabel.text = model.body
        case .two:
            titleLabel.text = "Номер телефона"
            bodyLabel.text = model.body
        case .three:
            titleLabel.text = "Email"
            bodyLabel.text = model.body
        case .four:
            titleLabel.text = "Рабочие устройства"
            bodyLabel.text = model.body
        case .five:
            titleLabel.text = "Навыки"
            bodyLabel.text = model.body
            setupButton()
        }
    }
    // MARK: - Obj
    @objc func buttonDidTap() {
        // editButton func
    }
}
// MARK: - Private metods
private extension PersonalDataCell {
    
    func setupConteiner() {
        contentView.addSubview(conteiner)
        conteiner.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            conteiner.topAnchor.constraint(equalTo: contentView.topAnchor),
            conteiner.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            contentView.bottomAnchor.constraint(equalTo: conteiner.bottomAnchor, constant: 20),
            contentView.rightAnchor.constraint(equalTo: conteiner.rightAnchor)
        ])
    }
    
    func setupLabel () {
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.heightAnchor.constraint(equalToConstant: 15),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16)
        ])
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            bodyLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
            contentView.bottomAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 21),
            bodyLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: 16)
        ])
    }
    
    func setupButton() {
        contentView.addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            editButton.widthAnchor.constraint(equalToConstant: 20),
            editButton.heightAnchor.constraint(equalToConstant: 20),
            editButton.topAnchor.constraint(equalTo: bodyLabel.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: editButton.bottomAnchor, constant: 23),
            contentView.rightAnchor.constraint(equalTo: editButton.rightAnchor, constant: 16)
        ])
    }
}
