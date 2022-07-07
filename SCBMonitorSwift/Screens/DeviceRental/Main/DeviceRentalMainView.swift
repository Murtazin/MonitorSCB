import UIKit

protocol DeviceRentalMainViewDelegateProtocol: AnyObject {
    func segmentDidChanged()
}

class DeviceRentalMainView: UIView {
    // MARK: - Data
    var iOSDevices = [
        Device(image: UIImage(named: "image"), title: "iPhone", subtitle: "Free"), Device(image: UIImage(named: "image"), title: "iPhone", subtitle: "Free"), Device(image: UIImage(named: "image"), title: "iPhone", subtitle: "Free"), Device(image: UIImage(named: "image"), title: "iPhone", subtitle: "Free"), Device(image: UIImage(named: "image"), title: "iPhone", subtitle: "Free"), Device(image: UIImage(named: "image"), title: "iPhone", subtitle: "Free"), Device(image: UIImage(named: "image"), title: "iPhone", subtitle: "Free")
    ]
    var androidDevices = [
        Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy"), Device(image: UIImage(named: "image1"), title: "Samsung", subtitle: "Busy")
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
            return cell
        } else {
            let model = androidDevices[indexPath.row]
            cell.configureCell(by: model.image, title: model.title, subtitle: model.subtitle)
            return cell
        }
    }
}
// MARK: - UITableViewDelegate

extension DeviceRentalMainView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
