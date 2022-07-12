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
        employeesTableView.separatorStyle = .none
        return employeesTableView
    }()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Сотрудники"
        view.backgroundColor = .systemBackground
        
        setUpUI()
    }
    
    // MARK: - Data
    var data: [EmployeesHeaderViewModel] = [
        EmployeesHeaderViewModel(titleText: "Проект менеджеры",
                                 cells: [(EmployeeCellViewModel(image: UIImage(named: "userMock-icon"), title: "Мария Петрова", subtitle: "Халенок")), (EmployeeCellViewModel(image: UIImage(named: "userMock-icon"), title: "Татьяна Сидорова", subtitle: "Женский банк"))
                                        ],
                                 isExpanded: false),
        EmployeesHeaderViewModel(titleText: "Дизайнеры",
                                 cells: [(EmployeeCellViewModel(image: UIImage(named: "userMock-icon"), title: "Мария Петрова", subtitle: "Халенок")), (EmployeeCellViewModel(image: UIImage(named: "userMock-icon"), title: "Татьяна Сидорова", subtitle: "Женский банк"))
                                        ],
                                 isExpanded: false),
        EmployeesHeaderViewModel(titleText: "Аналитики",
                                 cells: [(EmployeeCellViewModel(image: UIImage(named: "userMock-icon"), title: "Мария Петрова", subtitle: "Халенок")), (EmployeeCellViewModel(image: UIImage(named: "userMock-icon"), title: "Татьяна Сидорова", subtitle: "Женский банк"))
                                        ],
                                 isExpanded: false),
        EmployeesHeaderViewModel(titleText: "Тестировщики",
                                 cells: [(EmployeeCellViewModel(image: UIImage(named: "userMock-icon"), title: "Мария Петрова", subtitle: "Халенок")), (EmployeeCellViewModel(image: UIImage(named: "userMock-icon"), title: "Татьяна Сидорова", subtitle: "Женский банк"))
                                        ],
                                 isExpanded: false),
        EmployeesHeaderViewModel(titleText: "Frontend-разработчики",
                                 cells: [(EmployeeCellViewModel(image: UIImage(named: "userMock-icon"), title: "Валентин Иванов", subtitle: "Женский банк")), (EmployeeCellViewModel(image: UIImage(named: "userMock-icon"), title: "Олег Янковский", subtitle: "Финансовый помощник"))
                                        ],
                                 isExpanded: false)
    ]
}

// MARK: - Private
private extension EmployeesViewController {
    func setUpUI() {
        
        employeesTableView.tableFooterView = UIView()
        
        employeesTableView.delegate = self
        employeesTableView.dataSource = self
        
        employeesTableView.register(EmployeesCustomTableViewCell.self, forCellReuseIdentifier: EmployeesCustomTableViewCell.reuseIdentitfier)
        employeesTableView.register(EmployeesTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: EmployeesTableViewHeaderView.reuseIdentifier)
        
        employeesTableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(employeesTableView)
        employeesTableView.embed(in: view)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension EmployeesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !data[section].isExpanded {
            return 0
        }
        return data[section].cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmployeesCustomTableViewCell.reuseIdentitfier, for: indexPath) as! EmployeesCustomTableViewCell
        let model = data[indexPath.section].cells[indexPath.row]
        cell.configure(by: model.image, title: model.title, subtitle: model.subtitle)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: EmployeesTableViewHeaderView.reuseIdentifier) as! EmployeesTableViewHeaderView
        header.configure(by: data[section].titleText, section: section)
        header.rotateImage(data[section].isExpanded)
        header.delegate = self
        return header
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
}

// MARK: - EmployeesTableViewHeaderViewDelegate
extension EmployeesViewController: EmployeesTableViewHeaderViewDelegate {
    func expandedSection(button: UIButton) {
        let section = button.tag
        let isExpanded = data[section].isExpanded
        data[section].isExpanded = !isExpanded
        employeesTableView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
}
