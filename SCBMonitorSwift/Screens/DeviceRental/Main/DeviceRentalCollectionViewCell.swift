import UIKit

class DeviceRentalCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    
    static let reuseId = "deviceRentalCollectionViewCell"
    // MARK: - UI
    
    lazy var deviceImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "image")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var deviceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "iPhone"
        label.textColor = UIColor(red: 61.0 / 255, green: 64.0 / 255, blue: 67.0 / 255, alpha: 1)
        return label
    }()
    
    lazy var deviceStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Free"
        label.textColor = UIColor(red: 196.0 / 255, green: 196.0 / 255, blue: 196.0 / 255, alpha: 1)
        return label
    }()
    // MARK: - Overrided
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        deviceImageView.translatesAutoresizingMaskIntoConstraints = false
        deviceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        deviceStatusLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            deviceImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            deviceImageView.topAnchor.constraint(equalTo: self.topAnchor),
            deviceImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            deviceImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
//        NSLayoutConstraint.activate([
//            deviceTitleLabel.leadingAnchor.constraint(equalTo: deviceImageView.trailingAnchor, constant: 20),
//            deviceTitleLabel.trailingAnchor.constraint(equalTo: self.),
//            deviceTitleLabel.topAnchor.constraint(equalTo: self.topAnchor),
//            deviceTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//        ])
//        NSLayoutConstraint.activate([
//            deviceTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            deviceTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
//            deviceTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
//            deviceTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16)
//        ])
//        NSLayoutConstraint.activate([
//            deviceStatusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
//            deviceStatusLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
//            deviceStatusLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
//            deviceStatusLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 16)
//        ])
    }
    
    private func setUpContentView() {
        contentView.addSubview(deviceImageView)
//        contentView.addSubview(deviceTitleLabel)
//        contentView.addSubview(deviceStatusLabel)
    }
}
