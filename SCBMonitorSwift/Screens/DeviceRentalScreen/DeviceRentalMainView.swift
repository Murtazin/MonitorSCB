//
//  DeviceRentalViewController.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 07.07.22.
//

import UIKit

class DeviceRentalMainView: UIView {
    
    // MARK: - Data
    var iOSDevices: [Device] = []
    var androidDevices: [Device] = []
    
    // MARK: - Private properties
    private lazy var segmentedControlView: CustomSegmentedControl = {
        let segmntedControlView = CustomSegmentedControl()
        segmntedControlView.setButtonTitles(buttonTitles: ["IOS", "Android"])
        segmntedControlView.selectorViewColor = MColors.spray
        segmntedControlView.selectorTextColor = MColors.spray
        return segmntedControlView
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Life cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUserInterface()
        setupMockData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Mocked data
    private var devices = [
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 1", subtitle: "free", isBusy: false),
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 2", subtitle: "free", isBusy: false),
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 3", subtitle: "free", isBusy: false),
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 4", subtitle: "free", isBusy: false),
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 5", subtitle: "free", isBusy: false),
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 6", subtitle: "free", isBusy: false),
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 7", subtitle: "free", isBusy: false),
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 8", subtitle: "free", isBusy: false),
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 9", subtitle: "free", isBusy: false),
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 10", subtitle: "free", isBusy: false),
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 11", subtitle: "free", isBusy: false),
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 12", subtitle: "free", isBusy: false),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 1", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 2", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 3", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 4", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 5", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 6", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 7", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 8", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 9", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 10", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 11", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 12", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 13", subtitle: "Busy", isBusy: true),
        Device(id: 0, operatingSystem: .android, image: UIImage(named: "image1"), title: "Samsung 14", subtitle: "Busy", isBusy: true)
    ]
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension DeviceRentalMainView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return segmentedControlView.selectedIndex == 0 ? iOSDevices.count : androidDevices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeviceRentalTableViewCell.reuseIdentifier, for: indexPath) as! DeviceRentalTableViewCell
        let device = segmentedControlView.selectedIndex == 0 ? iOSDevices[indexPath.row] : androidDevices[indexPath.row]
        cell.configure(by: device.image, title: device.title, subtitle: device.subtitle)
        cell.deviceStatusDidChanged(isBusy: device.isBusy)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        switch segmentedControlView.selectedIndex {
        case 0:
            let device = iOSDevices[indexPath.row]
            let rentDeviceAction = UIContextualAction(style: .normal, title: nil) { [weak self] (action, view, handler) in
                self?.iOSDevices[indexPath.row].isBusy.toggle()
                self?.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            let image = device.isBusy ? UIImage(named: "vector") : UIImage(named: "cross")
            let backgroundColor = device.isBusy ? MColors.spray : MColors.heliotrope
            rentDeviceAction.image = image
            rentDeviceAction.backgroundColor = backgroundColor
            let configuration = UISwipeActionsConfiguration(actions: [rentDeviceAction])
            configuration.performsFirstActionWithFullSwipe = false
            return configuration
        case 1:
            let device = androidDevices[indexPath.row]
            let rentDeviceAction = UIContextualAction(style: .normal, title: nil) { [weak self] (action, view, handler) in
                self?.androidDevices[indexPath.row].isBusy.toggle()
                self?.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            let image = device.isBusy ? UIImage(named: "vector") : UIImage(named: "cross")
            let backgroundColor = device.isBusy ? MColors.spray : MColors.heliotrope
            rentDeviceAction.image = image
            rentDeviceAction.backgroundColor = backgroundColor
            let configuration = UISwipeActionsConfiguration(actions: [rentDeviceAction])
            configuration.performsFirstActionWithFullSwipe = false
            return configuration
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - CustomSegmentedControlDelegate
extension DeviceRentalMainView: CustomSegmentedControlDelegate {
    func change(to index: Int) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

private extension DeviceRentalMainView {
    func setUpUserInterface() {
        backgroundColor = .systemBackground
        
        segmentedControlView.delegate = self
        segmentedControlView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(segmentedControlView)
        NSLayoutConstraint.activate([
            segmentedControlView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            segmentedControlView.leftAnchor.constraint(equalTo: leftAnchor),
            segmentedControlView.rightAnchor.constraint(equalTo: rightAnchor),
            segmentedControlView.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        tableView.register(DeviceRentalTableViewCell.self, forCellReuseIdentifier: DeviceRentalTableViewCell.reuseIdentifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor, constant: 16),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    func setupMockData() {
        iOSDevices = devices.filter({ $0.operatingSystem == .iOS })
        androidDevices = devices.filter({ $0.operatingSystem == .android })
    }
}
