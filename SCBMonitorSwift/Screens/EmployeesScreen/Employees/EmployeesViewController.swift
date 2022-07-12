//
//  EmployeesViewController.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 11.07.2022.
//

import UIKit

final class EmployeesViewController: UIViewController {
    
    // MARK: - Private properties
    private lazy var employeesTableView: UITableView = {
        let employeesTableView = UITableView()
        return employeesTableView
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Сотрудники"
        view.backgroundColor = .systemBackground
        
        setUpUI()
    }
}

// MARK: - Private
private extension EmployeesViewController {
    func setUpUI() {
        
        employeesTableView.delegate = self
        employeesTableView.dataSource = self
        
        employeesTableView.register(EmployeesCustomTableViewCell.self, forCellReuseIdentifier: EmployeesCustomTableViewCell.reuseIdentitfier)
        
        employeesTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(employeesTableView)
        employeesTableView.embed(in: view)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension EmployeesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20 // model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeesCustomTableViewCell.reuseIdentitfier, for: indexPath) as! EmployeesCustomTableViewCell
        return cell
    }
}
