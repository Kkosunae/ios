//
//  WalkView.swift
//  kkosunae
//
//  Created by 전현성 on 2023/10/08.
//

import UIKit
import SnapKit

class WalkView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    // View
    let topImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img_walk_view_top")
        
        return view
    }()
    
    let bottomImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img_walk_view_bottom")
        
        return view
    }()
    
    let dogImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img_dog")
        
        return view
    }()
    
    let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("바로 시작하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        return button
    }()
    
    let arrowImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "icon_right_arrow")
        
        return view
    }()
    
    // Layout
    private func setupLayout() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.masksToBounds = true
        
        addSubview(topImageView)
        topImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(126)
        }
        
        addSubview(bottomImageView)
        bottomImageView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(73)
        }
        
        addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        addSubview(arrowImageView)
        arrowImageView.snp.makeConstraints { make in
            make.leading.equalTo(startButton.snp.trailing).offset(12)
            make.bottom.equalToSuperview().offset(-20)
        }
        
        addSubview(dogImageView)
        dogImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(36)
            make.leading.equalTo(arrowImageView.snp.trailing).offset(8)
            make.trailing.bottom.equalToSuperview()
        }
    }
    
}
