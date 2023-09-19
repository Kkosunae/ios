//
//  HomeViewController.swift
//  kkosunae
//
//  Created by 전현성 on 2023/09/19.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    
    // View
    let customNavigationView: CustomNavigationView = {
        let view = CustomNavigationView()
        view.titleLabel.text = "홈"
        
        return view
    }()
    
    // Layout
    private func setupLayout() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        view.addSubview(customNavigationView)
        customNavigationView.snp.makeConstraints { make in
            make.trailing.leading.equalTo(0)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(50)
        }
    }
}
