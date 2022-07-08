import Foundation
import UIKit

enum OperatingSystem {
    case iOS
    case android
}

struct Device {
    var id: Int
    var operatingSystem: OperatingSystem
    var image: UIImage?
    var title: String
    var subtitle: String
    var isBusy: Bool
}
