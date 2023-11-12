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
        
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "icon_home")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_home_selected")?.withRenderingMode(.alwaysOriginal))
        mapVC.tabBarItem = UITabBarItem(title: "지도", image: UIImage(named: "icon_map")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_map_selected")?.withRenderingMode(.alwaysOriginal))
        communityVC.tabBarItem = UITabBarItem(title: "커뮤니티", image: UIImage(named: "icon_community")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_community_selected")?.withRenderingMode(.alwaysOriginal))
        pointVC.tabBarItem = UITabBarItem(title: "포인트", image: UIImage(named: "icon_point")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_point_selected")?.withRenderingMode(.alwaysOriginal))
        myPageVC.tabBarItem = UITabBarItem(title: "마이페이지", image: UIImage(named: "icon_my")?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage(named: "icon_my_selected")?.withRenderingMode(.alwaysOriginal))
        
        tabBar.tintColor = .nightBlackColor
        tabBar.unselectedItemTintColor = UIColor.init(hexCode: "8F8F8F")
        
        setViewControllers([homeVC, mapVC, communityVC, pointVC, myPageVC], animated: true)
    }
}
