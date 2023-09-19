//
//  SplashViewController.swift
//  kkosunae
//
//  Created by 전현성 on 2023/09/19.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: - Splash
        moveToTabBarController()
    }
    
    private func moveToTabBarController() {
        UIApplication.shared.windows.first?.rootViewController = TabBarController()
    }
}

