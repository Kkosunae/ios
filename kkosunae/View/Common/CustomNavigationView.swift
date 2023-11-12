//
//  CustomNavigationView.swift
//  kkosunae
//
//  Created by 전현성 on 2023/09/19.
//

import UIKit
import SnapKit
import RxSwift

class CustomNavigationView: UIView {
    let backgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img_navigation_background")
        
        return view
    }()
    
    let logoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "pawprint.fill")
        
        return view
    }()
    
    let titleImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img_title")
        
        return view
    }()
    
    let notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "icon_notification"), for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = .white
        
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        backgroundView.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.leading.equalTo(12)
            make.bottom.equalTo(backgroundView.snp.bottom).offset(-16)
        }
        
        backgroundView.addSubview(titleImage)
        titleImage.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView.snp.centerY)
            make.leading.equalTo(logoImageView.snp.trailing).offset(12)
        }
        
        backgroundView.addSubview(notificationButton)
        notificationButton.snp.makeConstraints { make in
            make.centerY.equalTo(logoImageView.snp.centerY)
            make.trailing.equalToSuperview().offset(-12)
            make.width.height.equalTo(20)
        }
    }
}
