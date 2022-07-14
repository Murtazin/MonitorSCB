//
//  NotifyScreenViewController.swift
//  SCBMonitorSwift
//
//  Created by Тимофей Борисов on 09.07.2022.
//

import UIKit

final class NotifyScreenViewController: UIViewController {
    
// MARK: - Private Properties
    weak var notifyScreenCoordinatorHandler: NotifyScreenFlowCoordinatorHandler?
    
    private let tableView = UITableView()
    
    let notifyDateFormatter = NotifyDateFormatter()
    
//    private var notify = [NotifyModel(id: 1,
//                              title: "День рождения Карины",
//                              body: "Сегодня поздравляем Карину. Собираем деньги на подарок. Подарок подарок",
//                                      isRead: false,
//                                      date: Date("23.10.2000")),
//                  NotifyModel(id: 2,
//                              title: "День рождения Данила",
//                              body: "Сегодня поздравляем Данила. Собираем деньги на подарок. Подарок подарок",
//                              isRead: true,
//                              date: "12/152022"),
//                  NotifyModel(id: 3,
//                              title: "День рождения Татьяны",
//                              body: "Сегодня поздравляем Татьяну. Собираем деньги на подарок. Подарок подарок",
//                              isRead: false,
//                              date: "07/232020")]
    
// MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Уведомления"
        view.backgroundColor = .white
        
        setupTableView()
        
        print(notifyDateFormatter.convertDate(dateString: Date()))
    }
}

// MARK: - Setup UI
private extension NotifyScreenViewController {
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(NotifyCell.self, forCellReuseIdentifier: notifyCellIdentifier)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            view.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            view.rightAnchor.constraint(equalTo: tableView.rightAnchor)
        ])
    }
}

// MARK: - TableView Metods
extension NotifyScreenViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notify.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: notifyCellIdentifier, for: indexPath) as! NotifyCell
        
        let notificitaion = notify[indexPath.item]
        cell.configure(notificitaion)
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        #warning("TODO: Review ")
        notifyScreenCoordinatorHandler?.openNotifItem(notify[indexPath.item]) // model -> model.id -> coordinator..
    }
}
