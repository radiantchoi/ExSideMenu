//
//  ContainerViewController.swift
//  ExSideMenu
//
//  Created by 최경민 on 2023/08/17.
//

import UIKit

final class ContainerViewController: UIViewController {
    private var sideMenuViewController: SideMenuViewController!
    private var navigator: UINavigationController!
    private var rootViewController: ContentViewController! {
        didSet {
            rootViewController.delegate = self
            navigator.setViewControllers([rootViewController], animated: false)
        }
    }
    
    convenience init(sideMenuViewController: SideMenuViewController,
                     rootViewController: ContentViewController) {
        self.init()
        
        self.sideMenuViewController = sideMenuViewController
        self.rootViewController = rootViewController
        self.navigator = UINavigationController(rootViewController: rootViewController)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    private func configureView() {
        addChildViewControllers()
        configureDelegates()
        configureGestures()
    }
    
    private func addChildViewControllers() {
        addChild(navigator)
        view.addSubview(navigator.view)
        navigator.didMove(toParent: self)
        
        addChild(sideMenuViewController)
        view.addSubview(sideMenuViewController.view)
        sideMenuViewController.didMove(toParent: self)
    }
    
    private func configureDelegates() {
        sideMenuViewController.delegate = self
        rootViewController.delegate = self
    }
    
    private func configureGestures() {
        let swipeLeftGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft))
        swipeLeftGesture.direction = .left
        swipeLeftGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeLeftGesture)
        
        let swipeRightGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(swipedRight))
        swipeRightGesture.edges = .left
        swipeRightGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeRightGesture)
    }
    
    @objc private func swipedLeft() {
        sideMenuViewController.hide()
    }
    
    @objc private func swipedRight() {
        sideMenuViewController.show()
    }
    
    func updateRootViewController(_ viewController: ContentViewController) {
        rootViewController = viewController
    }
}

extension ContainerViewController: SideMenuDelegate {
    func menuButtonTapped() {
        sideMenuViewController.show()
    }
    
    func itemSelected(item: ContentViewControllerPresentation) {
        switch item {
        case let .embed(vc):
            updateRootViewController(vc)
            sideMenuViewController.hide()
        case let .push(vc):
            sideMenuViewController.hide()
            navigator.pushViewController(vc, animated: true)
        case let .modal(vc):
            sideMenuViewController.hide()
            navigator.present(vc, animated: true, completion: nil)
        }
    }
}
