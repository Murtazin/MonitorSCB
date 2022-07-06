import UIKit

protocol DeviceRentalMainViewDelegateProtocol: AnyObject {
    func segmentDidChanged()
}

class DeviceRentalMainView: UIView {
    // MARK: - Properties
    
    weak var delegate: DeviceRentalMainViewDelegateProtocol?
    // MARK: - UI
    
    lazy var segmentControlView: UISegmentedControl = {
        let items = ["IOS", "Android"]
        let view = UISegmentedControl(items: items)
        view.selectedSegmentTintColor = UIColor(red: 115.0 / 255, green: 223.0 / 255, blue: 237.0 / 255, alpha: 1.0)
        view.tintColor = UIColor(red: 223.0 / 255, green: 223.0 / 255, blue: 223.0 / 255, alpha: 1.0)
        view.selectedSegmentIndex = 0
        view.addTarget(self, action: #selector(segmentDidChanged(_:)), for: .valueChanged)
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .systemBackground
        view.register(DeviceRentalCollectionViewCell.self, forCellWithReuseIdentifier: DeviceRentalCollectionViewCell.reuseId)
        view.delegate = self
        view.dataSource = self
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
        self.addSubview(segmentControlView)
        self.addSubview(collectionView)
    }
    
    private func setUpConstraints() {
        segmentControlView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentControlView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            segmentControlView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            segmentControlView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            collectionView.topAnchor.constraint(equalTo: segmentControlView.bottomAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: 16)
        ])
    }
    // MARK: - OBJC functions
    
    @objc private func segmentDidChanged(_ sender: UISegmentedControl) {
        delegate?.segmentDidChanged()
    }
}
// MARK: - UICollectionViewDelegateFlowLayout

extension DeviceRentalMainView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 100)
    }
}
// MARK: -

extension DeviceRentalMainView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DeviceRentalCollectionViewCell.reuseId, for: indexPath) as? DeviceRentalCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
}
