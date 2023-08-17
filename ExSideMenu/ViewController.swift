//
//  ViewController.swift
//  ExSideMenu
//
//  Created by 최경민 on 2023/08/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemGreen
    }
}

final class HomeViewController: ContentViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Home"
    }
}


final class SettingsViewController: ContentViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        title = "Settings"
    }
}
