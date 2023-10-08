//
//  WalkResultView.swift
//  kkosunae
//
//  Created by 전현성 on 2023/10/08.
//

import UIKit
import SnapKit

class WalkResultView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    // MARK: - View
    let divisionView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    // TODO: - graph
    let graphView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        return view
    }()
    
    let footmarkTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "내가 찍은 발도장"
        label.font = .systemFont(ofSize: 10)
        
        return label
    }()
    
    let footmarkCountLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.font = .boldSystemFont(ofSize: 48)
        
        return label
    }()
    
    let totalDistanceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "총 산책 거리"
        label.font = .systemFont(ofSize: 10)
        
        return label
    }()
    
    let totalDistanceValueLabel: UILabel = {
        let label = UILabel()
        let attributeString = NSMutableAttributedString(string: "54km")
        let font = UIFont.boldSystemFont(ofSize: 48)
        attributeString.addAttribute(.font, value: font, range: ("54km" as NSString).range(of: "54"))
        label.attributedText = attributeString
        
        return label
    }()
    
    // MARK: - Layout
    private func setupLayout() {
        self.backgroundColor = .green
        self.layer.cornerRadius = 10
        
        self.addSubview(divisionView)
        divisionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(0.5)
            make.center.equalToSuperview()
        }
        
        self.addSubview(graphView)
        graphView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(70)
        }
        
        self.addSubview(footmarkTitleLabel)
        footmarkTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(divisionView.snp.top).offset(16)
            make.trailing.equalTo(divisionView.snp.leading).offset(-12)
        }
        
        self.addSubview(footmarkCountLabel)
        footmarkCountLabel.snp.makeConstraints { make in
            make.trailing.equalTo(divisionView.snp.leading).offset(-12)
            make.bottom.equalTo(divisionView.snp.bottom).offset(-8)
        }
        
        self.addSubview(totalDistanceTitleLabel)
        totalDistanceTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(divisionView.snp.top).offset(16)
            make.leading.equalTo(divisionView.snp.trailing).offset(12)
        }
        
        self.addSubview(totalDistanceValueLabel)
        totalDistanceValueLabel.snp.makeConstraints { make in
            make.leading.equalTo(divisionView.snp.trailing).offset(12)
            make.bottom.equalTo(divisionView.snp.bottom).offset(-8)
        }
    }
}
