import UIKit

protocol DeviceRentalMainViewDelegateProtocol: AnyObject {
    func segmentDidChanged()
}

class DeviceRentalMainView: UIView {
    // MARK: - Data
    
    var iOSDevices = [
        Device(image: UIImage(named: "image"), title: "iPhone1", subtitle: "Free", isAmusing: false), Device(image: UIImage(named: "image"), title: "iPhone2", subtitle: "Free", isAmusing: false), Device(image: UIImage(named: "image"), title: "iPhone3", subtitle: "Free", isAmusing: false), Device(image: UIImage(named: "image"), title: "iPhone4", subtitle: "Free", isAmusing: false), Device(image: UIImage(named: "image"), title: "iPhone5", subtitle: "Free", isAmusing: false), Device(image: UIImage(named: "image"), title: "iPhone6", subtitle: "Free", isAmusing: false)
    ]
    var androidDevices = [
        Device(image: UIImage(named: "image1"), title: "Samsung1", subtitle: "Busy", isAmusing: false), Device(image: UIImage(named: "image1"), title: "Samsung2", subtitle: "Busy", isAmusing: false), Device(image: UIImage(named: "image1"), title: "Samsung3", subtitle: "Busy", isAmusing: false), Device(image: UIImage(named: "image1"), title: "Samsung4", subtitle: "Busy", isAmusing: false), Device(image: UIImage(named: "image1"), title: "Samsung5", subtitle: "Busy", isAmusing: false), Device(image: UIImage(named: "image1"), title: "Samsung6", subtitle: "Busy", isAmusing: false)
    ]
    
    // MARK: - Properties
    
    weak var delegate: DeviceRentalMainViewDelegateProtocol?
    // MARK: - UI
    
    lazy var segmentedControlView: UISegmentedControl = {
        let items = ["IOS", "Android"]
        let view = UISegmentedControl(items: items)
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(segmentDidChanged(_:)), for: .valueChanged)
        view.addUnderlineForSelectedSegment()
        return view
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
            tableView.topAnchor.constraint(equalTo: segmentedControlView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    // MARK: - OBJC functions
    
    @objc private func segmentDidChanged(_ sender: UISegmentedControl) {
        segmentedControlView.changeUnderlinePosition()
        tableView.reloadData()
        delegate?.segmentDidChanged()
    }
}
// MARK: - UITableViewDataSource

extension DeviceRentalMainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segmentedControlView.selectedSegmentIndex == 0 {
            return iOSDevices.count
        } else {
            return androidDevices.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DeviceRentalTableViewCell.reuseIdentifier, for: indexPath) as? DeviceRentalTableViewCell else {
            return UITableViewCell()
        }
        if segmentedControlView.selectedSegmentIndex == 0 {
            let model = iOSDevices[indexPath.row]
            cell.configureCell(by: model.image, title: model.title, subtitle: model.subtitle)
            if model.isAmusing {
                let color = UIColor(red: 239.0 / 255, green: 240.0 / 255, blue: 246.0 / 255, alpha: 1)
                cell.deviceStatusDidChanged(color)
            } else {
                let color = UIColor(red: 225.0 / 255, green: 247.0 / 255, blue: 252.0 / 255, alpha: 1)
                cell.deviceStatusDidChanged(color)
            }
            return cell
        } else {
            let model = androidDevices[indexPath.row]
            cell.configureCell(by: model.image, title: model.title, subtitle: model.subtitle)
            if model.isAmusing {
                let color = UIColor(red: 239.0 / 255, green: 240.0 / 255, blue: 246.0 / 255, alpha: 1)
                cell.deviceStatusDidChanged(color)
            } else {
                let color = UIColor(red: 225.0 / 255, green: 247.0 / 255, blue: 252.0 / 255, alpha: 1)
                cell.deviceStatusDidChanged(color)
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if segmentedControlView.selectedSegmentIndex == 0 {
            let device = iOSDevices[indexPath.row]
            let image = device.isAmusing ? UIImage(named: "vector") : UIImage(named: "cross")
            let backgroundColor = device.isAmusing ? UIColor(red: 115.0 / 255, green: 223.0 / 255, blue: 237.0 / 255, alpha: 1) : UIColor(red: 166.0 / 255, green: 131.0 / 255, blue: 255.0 / 255, alpha: 1)
            let rentDeviceAction = UIContextualAction(style: .normal, title: nil) { (action, view, handler) in
                self.iOSDevices[indexPath.row].isAmusing.toggle()
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            rentDeviceAction.image = image
            rentDeviceAction.backgroundColor = backgroundColor
            let configuration = UISwipeActionsConfiguration(actions: [rentDeviceAction])
            configuration.performsFirstActionWithFullSwipe = false
            return configuration
        } else {
            let device = androidDevices[indexPath.row]
            let image = device.isAmusing ? UIImage(named: "vector") : UIImage(named: "cross")
            let backgroundColor = device.isAmusing ? UIColor(red: 115.0 / 255, green: 223.0 / 255, blue: 237.0 / 255, alpha: 1) : UIColor(red: 166.0 / 255, green: 131.0 / 255, blue: 255.0 / 255, alpha: 1)
            let rentDeviceAction = UIContextualAction(style: .normal, title: nil) { (action, view, handler) in
                self.androidDevices[indexPath.row].isAmusing.toggle()
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
            rentDeviceAction.image = image
            rentDeviceAction.backgroundColor = backgroundColor
            let configuration = UISwipeActionsConfiguration(actions: [rentDeviceAction])
            configuration.performsFirstActionWithFullSwipe = false
            return configuration
        }
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
