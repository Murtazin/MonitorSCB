import UIKit

class DeviceRentalTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    static let reuseIdentifier = "deviceRentalTableViewCell"
    
    // MARK: - UI
    private lazy var view: UIView = {
        let view = UIView()
        view.layer.borderColor = CGColor(red: 235.0 / 255, green: 232.0 / 255, blue: 252.0 / 255, alpha: 1)
        view.layer.borderWidth = 2
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var deviceImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var deviceTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 61.0 / 255, green: 64.0 / 255, blue: 67.0 / 255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.sizeToFit()
        return label
    }()
    
    private lazy var deviceStatusLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 196.0 / 255, green: 196.0 / 255, blue: 196.0 / 255, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    // MARK: - Overrided
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpContentView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpConstraints()
    }
    // MARK: - Private functions
    
    private func setUpConstraints() {
        view.translatesAutoresizingMaskIntoConstraints = false
        deviceImageView.translatesAutoresizingMaskIntoConstraints = false
        deviceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        deviceStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            deviceImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            deviceImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            deviceTitleLabel.topAnchor.constraint(equalTo: deviceImageView.topAnchor, constant: 4),
            deviceTitleLabel.leadingAnchor.constraint(equalTo: deviceImageView.trailingAnchor, constant: 28),
            deviceStatusLabel.topAnchor.constraint(equalTo: deviceTitleLabel.bottomAnchor, constant: 12),
            deviceStatusLabel.leadingAnchor.constraint(equalTo: deviceImageView.trailingAnchor, constant: 28)
        ])
    }
    
    private func setUpContentView() {
        contentView.addSubview(view)
        view.addSubview(deviceImageView)
        view.addSubview(deviceTitleLabel)
        view.addSubview(deviceStatusLabel)
    }
    // MARK: - Other functions
    
    func configureCell(by image: UIImage?, title: String, subtitle: String) {
        guard let image = image else {
            return
        }
        self.deviceImageView.image = image
        self.deviceTitleLabel.text = title
        self.deviceStatusLabel.text = subtitle
    }
}
