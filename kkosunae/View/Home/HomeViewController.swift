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
        walkResultView.setChartData(count: 12)
    }
    
    override func viewDidLayoutSubviews() {
        walkView.roundCorners(corners: [.topLeft, .topRight], radius: 22)
        walkResultView.drawShadow(width: 0, height: 3, opacity: 0.11, radius: 7)
    }
    
    // MARK: - View
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let customNavigationView: CustomNavigationView = {
        let view = CustomNavigationView()
        
        return view
    }()
    
    let walkView: WalkView = {
        let view = WalkView()
        
        return view
    }()
    
    let walkResultView: WalkResultView = {
        let view = WalkResultView()
        
        return view
    }()
    
    let hotFootmarkTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "핫 발자국"
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    // MARK: - Layout
    private func setupLayout() {
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        self.view.addSubview(customNavigationView)
        customNavigationView.snp.makeConstraints { make in
            make.trailing.leading.equalTo(0)
            make.top.equalToSuperview()
            make.height.equalTo(105)
        }
        
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(customNavigationView.snp.bottom)
            make.leading.trailing.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(-4)
        }
        
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.centerX.equalToSuperview()
        }
        
        contentView.addSubview(walkView)
        walkView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(16)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(160)
        }
        
        contentView.addSubview(walkResultView)
        walkResultView.snp.makeConstraints { make in
            make.top.equalTo(walkView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(120)
            make.bottom.equalToSuperview() // For scrolling to work, the bottom of the last view must be the same as the super view.
        }
        
        contentView.addSubview(hotFootmarkTitleLabel)
        hotFootmarkTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(walkResultView.snp.bottom).offset(28)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
    }
}
