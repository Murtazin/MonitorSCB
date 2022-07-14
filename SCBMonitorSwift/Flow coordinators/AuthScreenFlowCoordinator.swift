//
//  AuthScreenFlowCoordinator.swift
//  SCBMonitorSwift
//
//  Created by ANTON DOBRYNIN on 05.07.2022.
//

import UIKit

protocol AuthScreenFlowCoordinatorHandler: AnyObject {
    func didSuccessLogin()
    func openNotif()
    func openGuide()
    func openPersonalPage()
}

final class AuthScreenFlowCoordinator: Coordinator {
    
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
        let authVC = AuthViewController()
        authVC.authScreenFlowCoordinatorHandler = self
        navigationController?.pushViewController(authVC, animated: false)
    }
//    func openGuide(){
//
//    }
}

// MARK: - CoordinatorFlowListener
extension AuthScreenFlowCoordinator: CoordinatorFlowListener {
    
    func onFlowFinished(coordinator: Coordinator) {
        childDependencies.remove(dependency: coordinator)
        
//        flowListener?.onFlowFinished(coordinator: coordinator)
    }
}

// MARK: - AuthScreenFlowCoordinatorHandler
extension AuthScreenFlowCoordinator: AuthScreenFlowCoordinatorHandler {
    func openPersonalPage() {
        onFlowFinished(coordinator: self)
    }
    
    
//    func openPersonalPage() {
//        let personalPageVC = PersonalPageViewController()
//        navigationController?.pushViewController(personalPageVC, animated: true)
//    }
    
    func openGuide() {
        onFlowFinished(coordinator: self)
//        let GuideCoordinator = GuideScreenFlowCoordinator(navigationController:
//                                                        navigationController,
//                                                        flowListener: self)
//        childDependencies.add(dependency: GuideCoordinator)
//        GuideCoordinator.start()
        let guideVC = GuideScreenViewController()
        navigationController?.pushViewController(guideVC, animated: true)
    }
    
    func openNotif() {
        onFlowFinished(coordinator: self)
        let notifyScreenCoordinator = NotifyScreenFlowCoordinator(navigationController:
                                                              navigationController,
                                                              flowListener: self)
        childDependencies.add(dependency: notifyScreenCoordinator)
        notifyScreenCoordinator.start()
    }
    
    func didSuccessLogin() {
//        UserDefaults.standard.set(true, forKey: "isUserLogged")
        
        onFlowFinished(coordinator: self)
        let mainScreenCoordinator = MainScreenFlowCoordinator(navigationController:
                                                              navigationController,
                                                              flowListener: self)
        childDependencies.add(dependency: mainScreenCoordinator)
        mainScreenCoordinator.start()
    }
}
