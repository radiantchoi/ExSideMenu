//
//  ContentViewController.swift
//  ExSideMenu
//
//  Created by 최경민 on 2023/08/17.
//

import UIKit

class ContentViewController: UIViewController {
    weak var delegate: SideMenuDelegate?
    private var barButtonImage: UIImage?
    
    convenience init(barButtonImage: UIImage?) {
        self.init()
        
        self.barButtonImage = barButtonImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private func configureView() {
        let barButtonItem = UIBarButtonItem(image: barButtonImage, style: .plain, target: self, action: #selector(menuTapped))
        navigationItem.setLeftBarButton(barButtonItem, animated: false)
    }
    
    @objc private func menuTapped() {
        delegate?.menuButtonTapped()
    }
}
