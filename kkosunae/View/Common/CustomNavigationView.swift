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
    let logoImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "pawprint.fill")
        
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    let notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "bell"), for: .normal)
        
        return button
    }()
    
    let moreButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        
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
        
        addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(12)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(logoImageView.snp.trailing).offset(12)
        }
        
        addSubview(moreButton)
        moreButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(-12)
        }
        
        addSubview(notificationButton)
        notificationButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(moreButton.snp.leading).offset(-12)
        }
    }
}
