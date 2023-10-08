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
    let startButton: UIButton = {
       let button = UIButton()
        button.setTitle("바로 시작하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    // Layout
    private func setupLayout() {
        self.backgroundColor = .orange
        self.layer.cornerRadius = 10
        
        self.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
}
