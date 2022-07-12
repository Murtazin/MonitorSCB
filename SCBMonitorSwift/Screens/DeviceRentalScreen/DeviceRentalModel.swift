//
//  DeviceRentalViewController.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 07.07.22.
//

import UIKit

enum OperatingSystem {
    case iOS
    case android
}

struct DeviceRentalModel {
    let id: Int
    var operatingSystem: OperatingSystem
    
    #warning("TODO: Why optional ?")
    var image: UIImage?
    var title: String
    var subtitle: String
    var isBusy: Bool
}
