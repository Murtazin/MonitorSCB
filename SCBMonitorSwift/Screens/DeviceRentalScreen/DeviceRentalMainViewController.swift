//
//  DeviceRentalViewController.swift
//  SCBMonitorSwift
//
//  Created by Renat Murtazin on 07.07.22.
//

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
        title = "Аренда устройств"
    }
}
