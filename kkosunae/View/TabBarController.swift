//
//  TabBarController.swift
//  kkosunae
//
//  Created by 전현성 on 2023/09/19.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let mapVC = UINavigationController(rootViewController: MapViewController())
        let pointVC = UINavigationController(rootViewController: PointViewController())
        let communityVC = UINavigationController(rootViewController: CommunityViewController())
        let myPageVC = UINavigationController(rootViewController: MyPageViewController())
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house.fill"))
        mapVC.tabBarItem = UITabBarItem(title: "지도", image: UIImage(systemName: "map"), selectedImage: UIImage(systemName: "map.fill"))
        pointVC.tabBarItem = UITabBarItem(title: "포인트", image: UIImage(systemName: "dollarsign.circle"), selectedImage: UIImage(systemName: "dollarsign.circle.fill"))
        communityVC.tabBarItem = UITabBarItem(title: "커뮤니티", image: UIImage(systemName: "person.3"), selectedImage: UIImage(systemName: "person.3.fill"))
        myPageVC.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
        
        setViewControllers([homeVC, mapVC, pointVC, communityVC, myPageVC], animated: true)
    }
}
