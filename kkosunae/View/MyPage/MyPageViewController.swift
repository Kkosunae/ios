//
//  MyPageViewController.swift
//  kkosunae
//
//  Created by 전현성 on 2023/09/19.
//

import UIKit

class MyPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    
    // View
    
    // Layout
    private func setupLayout() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "마이페이지"
    }
}
