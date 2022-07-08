import UIKit

class DeviceRentalMainViewController: UIViewController {
    // MARK: - Properties
    
    var deviceRentalMainView = DeviceRentalMainView()
    // MARK: - View life cycle
    
    override func loadView() {
        view = deviceRentalMainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    // MARK: - Private functions
    
    private func configuration() {
        title = "Аренда устройств"
    }
}
