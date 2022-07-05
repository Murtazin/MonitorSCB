//
//  MainScreenFlowCoordinator.swift
//  SCBMonitorSwift
//
//  Created by ANTON DOBRYNIN on 05.07.2022.
//

import UIKit

protocol MainScreenFlowCoordinatorHandler: AnyObject {
//    func goToPersonalCabinetButtonDidTap()
}

final class MainScreenFlowCoordinator: Coordinator {
    
    var childDependencies: CoordinatorDependencies
    weak var flowListener: CoordinatorFlowListener?
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?,
         childDependencies: CoordinatorDependencies = DefaultCoordinatorDependencies(),
         flowListener: CoordinatorFlowListener?) {
        
        self.navigationController = navigationController
        self.childDependencies = childDependencies
        self.flowListener = flowListener
    }
    
    func start() {
        
        let mainVC = MainScreenViewController()
        mainVC.mainScreenCoordinatorHandler = self
        navigationController?.pushViewController(mainVC, animated: false)
    }
    
}

// MARK: - CoordinatorFlowListener
extension MainScreenFlowCoordinator: CoordinatorFlowListener {
    
    func onFlowFinished(coordinator: Coordinator) {
        childDependencies.remove(dependency: coordinator)
        
        flowListener?.onFlowFinished(coordinator: coordinator)
    }
}

// MARK: - MainScreenFlowCoordinatorHandler
extension MainScreenFlowCoordinator: MainScreenFlowCoordinatorHandler {
 
// Example
//    func goToPersonalCabinetButtonDidTap() {
//        let personalViewConroller = PersonalCabinetViewController()
//        navigationController?.pushViewController(personalViewConroller, animated: true)
//    }
 
}
