import UIKit

protocol DeviceRentalMainViewDelegateProtocol: AnyObject {
    func segmentDidChanged()
}

class DeviceRentalMainView: UIView {
    // MARK: - Data
    
    var devices = [
        Device(id: 0, operatingSystem: .iOS, image: UIImage(named: "image"), title: "iPhone 1", subtitle: "free", isBusy: true),
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
    
//    var iOSDevices = [
//        Device(id: 1, operatingSystem: "iOS", image: UIImage(named: "image"), title: "iPhone1", subtitle: "Free", isAmusing: false), Device(id: 1, operatingSystem: "iOS", image: UIImage(named: "image"), title: "iPhone2", subtitle: "Free", isAmusing: false), Device(id: 1, operatingSystem: "iOS", image: UIImage(named: "image"), title: "iPhone3", subtitle: "Free", isAmusing: false), Device(id: 1, operatingSystem: "iOS", image: UIImage(named: "image"), title: "iPhone4", subtitle: "Free", isAmusing: false), Device(id: 1, operatingSystem: "iOS", image: UIImage(named: "image"), title: "iPhone5", subtitle: "Free", isAmusing: false), Device(id: 1, operatingSystem: "iOS", image: UIImage(named: "image"), title: "iPhone6", subtitle: "Free", isAmusing: false), Device(id: 1, operatingSystem: "iOS", image: UIImage(named: "image"), title: "iPhone7", subtitle: "Free", isAmusing: false), Device(id: 1, operatingSystem: "iOS", image: UIImage(named: "image"), title: "iPhone1", subtitle: "Free", isAmusing: false), Device(id: 1, operatingSystem: "iOS", image: UIImage(named: "image"), title: "iPhone8", subtitle: "Free", isAmusing: false), Device(id: 1, operatingSystem: "iOS", image: UIImage(named: "image"), title: "iPhone9", subtitle: "Free", isAmusing: false), Device(id: 1, operatingSystem: "iOS", image: UIImage(named: "image"), title: "iPhone10", subtitle: "Free", isAmusing: false)
//    ]
//    var androidDevices = [
//        Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony1", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony2", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony3", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony4", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony5", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony6", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony7", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony8", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony9", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony10", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony11", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony12", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony13", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony13", subtitle: "Busy", isAmusing: true), Device(id: 1, operatingSystem: "Android", image: UIImage(named: "image1"), title: "Sony14", subtitle: "Busy", isAmusing: true)
//    ]
    
    // MARK: - Properties
    
    weak var delegate: DeviceRentalMainViewDelegateProtocol?
    // MARK: - UI
    
    lazy var segmentedControlView: CustomSegmentedControl = {
        let segment = CustomSegmentedControl()
        segment.setButtonTitles(buttonTitles: ["IOS", "Android"])
        segment.selectorViewColor = UIColor(red: 115.0 / 255, green: 223.0 / 255, blue: 237.0 / 255, alpha: 1)
        segment.selectorTextColor = UIColor(red: 115.0 / 255, green: 223.0 / 255, blue: 237.0 / 255, alpha: 1)
        segment.delegate = self
        return segment
    }()
    
    lazy var tableView: UITableView = {
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
    // MARK: - OBJC functions
    
    @objc private func segmentDidChanged(_ sender: UISegmentedControl) {
        tableView.reloadData()
        delegate?.segmentDidChanged()
    }
}
// MARK: - UITableViewDataSource

extension DeviceRentalMainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countOfAndroidDevices: Int = 0
        var countOfIOSDevices: Int = 0
        for device in devices {
            if device.operatingSystem == .iOS {
                countOfIOSDevices += 1
            } else {
                countOfAndroidDevices += 1
            }
        }
//        if segmentedControlView.selectedSegmentIndex == 0 {
//            return countOfIOSDevices
//        } else {
//            return countOfAndroidDevices
//        }
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DeviceRentalTableViewCell.reuseIdentifier, for: indexPath) as? DeviceRentalTableViewCell else {
            return UITableViewCell()
        }
        let device = devices[indexPath.row]
        if (device.operatingSystem == .iOS) && segmentedControlView.selectedIndex == 0
            //&& (
//            segmentedControlView.selectedSegmentIndex == 0)
        {
            cell.configureCell(by: device.image, title: device.title, subtitle: device.subtitle)
            if device.isBusy {
                let color = UIColor(red: 239.0 / 255, green: 240.0 / 255, blue: 246.0 / 255, alpha: 1)
                cell.deviceStatusDidChanged(color)
            } else {
                let color = UIColor(red: 255.0 / 255, green: 255.0 / 255, blue: 255.0 / 255, alpha: 1)
                cell.deviceStatusDidChanged(color)
            }
            return cell
        } else {
            cell.configureCell(by: device.image, title: device.title, subtitle: device.subtitle)
            if device.isBusy {
                let color = UIColor(red: 239.0 / 255, green: 240.0 / 255, blue: 246.0 / 255, alpha: 1)
                cell.deviceStatusDidChanged(color)
            } else {
                let color = UIColor(red: 255.0 / 255, green: 255.0 / 255, blue: 255.0 / 255, alpha: 1)
                cell.deviceStatusDidChanged(color)
            }
            return cell
        }
        
        
        
//        if segmentedControlView.selectedSegmentIndex == 0 {
//            let model = devices[indexPath.row]
//            switch model.operatingSystem {
//            case .iOS:
//                cell.configureCell(by: model.image, title: model.title, subtitle: model.subtitle)
//                if model.isAmusing {
//                    let color = UIColor(red: 239.0 / 255, green: 240.0 / 255, blue: 246.0 / 255, alpha: 1)
//                    cell.deviceStatusDidChanged(color)
//                } else {
//                    let color = UIColor(red: 225.0 / 255, green: 247.0 / 255, blue: 252.0 / 255, alpha: 1)
//                    cell.deviceStatusDidChanged(color)
//                }
//                return cell
//            case .android:
//                break
//            }
//            cell.configureCell(by: model.image, title: model.title, subtitle: model.subtitle)
//            if model.isAmusing {
//                let color = UIColor(red: 239.0 / 255, green: 240.0 / 255, blue: 246.0 / 255, alpha: 1)
//                cell.deviceStatusDidChanged(color)
//            } else {
//                let color = UIColor(red: 225.0 / 255, green: 247.0 / 255, blue: 252.0 / 255, alpha: 1)
//                cell.deviceStatusDidChanged(color)
//            }
//
//        } else {
//            let model = devices[indexPath.row]
//            switch model.operatingSystem {
//            case .android:
//                cell.configureCell(by: model.image, title: model.title, subtitle: model.subtitle)
//                if model.isAmusing {
//                    let color = UIColor(red: 239.0 / 255, green: 240.0 / 255, blue: 246.0 / 255, alpha: 1)
//                    cell.deviceStatusDidChanged(color)
//                } else {
//                    let color = UIColor(red: 225.0 / 255, green: 247.0 / 255, blue: 252.0 / 255, alpha: 1)
//                    cell.deviceStatusDidChanged(color)
//                }
//                return cell
//            }
//
//        }
    }
    
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        if segmentedControlView.selectedSegmentIndex == 0 {
//            let device = iOSDevices[indexPath.row]
//            let image = device.isAmusing ? UIImage(named: "vector") : UIImage(named: "cross")
//            let backgroundColor = device.isAmusing ? UIColor(red: 115.0 / 255, green: 223.0 / 255, blue: 237.0 / 255, alpha: 1) : UIColor(red: 166.0 / 255, green: 131.0 / 255, blue: 255.0 / 255, alpha: 1)
//            let rentDeviceAction = UIContextualAction(style: .normal, title: nil) { (action, view, handler) in
//                self.iOSDevices[indexPath.row].isAmusing.toggle()
//                self.tableView.reloadRows(at: [indexPath], with: .automatic)
//            }
//            rentDeviceAction.image = image
//            rentDeviceAction.backgroundColor = backgroundColor
//            let configuration = UISwipeActionsConfiguration(actions: [rentDeviceAction])
//            configuration.performsFirstActionWithFullSwipe = false
//            return configuration
//        } else {
//            let device = androidDevices[indexPath.row]
//            let image = device.isAmusing ? UIImage(named: "vector") : UIImage(named: "cross")
//            let backgroundColor = device.isAmusing ? UIColor(red: 115.0 / 255, green: 223.0 / 255, blue: 237.0 / 255, alpha: 1) : UIColor(red: 166.0 / 255, green: 131.0 / 255, blue: 255.0 / 255, alpha: 1)
//            let rentDeviceAction = UIContextualAction(style: .normal, title: nil) { (action, view, handler) in
//                self.androidDevices[indexPath.row].isAmusing.toggle()
//                self.tableView.reloadRows(at: [indexPath], with: .automatic)
//            }
//            rentDeviceAction.image = image
//            rentDeviceAction.backgroundColor = backgroundColor
//            let configuration = UISwipeActionsConfiguration(actions: [rentDeviceAction])
//            configuration.performsFirstActionWithFullSwipe = false
//            return configuration
//        }
//    }
    
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
        print("Pressing SegmentedControl \(index)")
    }
}
