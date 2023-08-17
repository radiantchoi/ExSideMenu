//
//  ContainerViewComposer.swift
//  ExSideMenu
//
//  Created by 최경민 on 2023/08/17.
//

import UIKit

final class ContainerViewComposer {
    static func makeContainer() -> ContainerViewController {
        let homeViewController = HomeViewController()
        let settingsViewController = SettingsViewController()
        let sideMenuItems = [
            SideMenuItem(icon: UIImage(systemName: "house.fill"),
                         name: "Home",
                         viewController: .embed(homeViewController)),
            SideMenuItem(icon: UIImage(systemName: "gear"),
                         name: "Settings",
                         viewController: .embed(settingsViewController))
        ]
        let sideMenuViewController = SideMenuViewController(sideMenuItems: sideMenuItems)
        let container = ContainerViewController(sideMenuViewController: sideMenuViewController,
                                                rootViewController: homeViewController)
        
        return container
    }
}
