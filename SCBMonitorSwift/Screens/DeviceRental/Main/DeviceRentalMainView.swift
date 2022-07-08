import UIKit

class DeviceRentalMainView: UIView {
    // MARK: - Data
    
    var devices = [
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
    
    var iOSDevices: [Device] = []
    var androidDevices: [Device] = []
    // MARK: - UI
    
    private lazy var segmentedControlView: CustomSegmentedControl = {
        let segment = CustomSegmentedControl()
        segment.setButtonTitles(buttonTitles: ["IOS", "Android"])
        segment.selectorViewColor = UIColor(red: 115.0 / 255, green: 223.0 / 255, blue: 237.0 / 255, alpha: 1)
        segment.selectorTextColor = UIColor(red: 115.0 / 255, green: 223.0 / 255, blue: 237.0 / 255, alpha: 1)
        segment.delegate = self
        return segment
    }()
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(DeviceRentalTableViewCell.self, forCellReuseIdentifier: DeviceRentalTableViewCell.reuseIdentifier)
        view.separatorStyle = .none
        return view
    }()
    // MARK: - Overrided
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        obtainIOSDevices()
        obtainAndroidDevices()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpConstraints()
    }
    // MARK: - Private functions
    
    private func setUpView() {
        self.backgroundColor = .systemBackground
        self.addSubview(segmentedControlView)
        self.addSubview(tableView)
    }
    
    private func setUpConstraints() {
        segmentedControlView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControlView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            segmentedControlView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            segmentedControlView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            segmentedControlView.heightAnchor.constraint(equalToConstant: 50),
            tableView.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor, constant: 16),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    private func obtainIOSDevices() {
        for device in devices {
            if device.operatingSystem == .iOS {
                iOSDevices.append(device)
            }
        }
    }
    
    private func obtainAndroidDevices() {
        for device in devices {
            if device.operatingSystem == .android {
                androidDevices.append(device)
            }
        }
    }
}
// MARK: - UITableViewDataSource

extension DeviceRentalMainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControlView.selectedIndex == 0 {
            return iOSDevices.count
        } else {
            return androidDevices.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DeviceRentalTableViewCell.reuseIdentifier, for: indexPath) as? DeviceRentalTableViewCell else {
            return UITableViewCell()
        }
        var device: Device?
        var color: UIColor?
        if segmentedControlView.selectedIndex == 0 {
            device = iOSDevices[indexPath.row]
        } else {
            device = androidDevices[indexPath.row]
        }
        guard let device = device else {
            return UITableViewCell()
        }
        cell.configureCell(by: device.image, title: device.title, subtitle: device.subtitle)
        if device.isBusy {
            color = UIColor(red: 239.0 / 255, green: 240.0 / 255, blue: 246.0 / 255, alpha: 1)
        } else {
            color = UIColor(red: 255.0 / 255, green: 255.0 / 255, blue: 255.0 / 255, alpha: 1)
        }
        guard let color = color else {
            return UITableViewCell()
        }

        cell.deviceStatusDidChanged(color)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        var device: Device?
        var rentDeviceAction: UIContextualAction?
        if segmentedControlView.selectedIndex == 0 {
            device = iOSDevices[indexPath.row]
            rentDeviceAction = UIContextualAction(style: .normal, title: nil) { (action, view, handler) in
                self.iOSDevices[indexPath.row].isBusy.toggle()
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        } else {
            device = androidDevices[indexPath.row]
            rentDeviceAction = UIContextualAction(style: .normal, title: nil) { (action, view, handler) in
                self.androidDevices[indexPath.row].isBusy.toggle()
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        guard let device = device, let rentDeviceAction = rentDeviceAction else {
            return nil
        }
        let image = device.isBusy ? UIImage(named: "vector") : UIImage(named: "cross")
        let backgroundColor = device.isBusy ? UIColor(red: 115.0 / 255, green: 223.0 / 255, blue: 237.0 / 255, alpha: 1) : UIColor(red: 166.0 / 255, green: 131.0 / 255, blue: 255.0 / 255, alpha: 1)
        rentDeviceAction.image = image
        rentDeviceAction.backgroundColor = backgroundColor
        let configuration = UISwipeActionsConfiguration(actions: [rentDeviceAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}
// MARK: - UITableViewDelegate

extension DeviceRentalMainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
