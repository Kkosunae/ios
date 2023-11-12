//
//  WalkResultView.swift
//  kkosunae
//
//  Created by 전현성 on 2023/10/08.
//

import UIKit
import SnapKit
import DGCharts

class WalkResultView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayout()
    }
    
    func setChartData(count: Int) {
        let totalCount = 15
        let filledCount = count
        let unfilledCount = totalCount - filledCount
        
        let filledEntry = PieChartDataEntry(value: Double(filledCount), label: "Filled")
        let unfilledEntry = PieChartDataEntry(value: Double(unfilledCount), label: "Unfilled")
        
        let dataSet = PieChartDataSet(entries: [filledEntry, unfilledEntry], label: "Example Dataset")
        dataSet.colors = [.visvisColor, .lightGray]
        dataSet.drawValuesEnabled = false
        dataSet.selectionShift = 0
        
        let data = PieChartData(dataSet: dataSet)
        pieChartView.data = data
    }
    
    // MARK: - View
    let divisionView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let pieChartView: PieChartView = {
        let view = PieChartView()
        view.minOffset = 0
        view.setExtraOffsets(left: 0, top: 0, right: 0, bottom: 0)
        
        view.legend.enabled = false
        view.chartDescription.enabled = false
        view.drawEntryLabelsEnabled = false
        view.centerText = ""
        
        view.holeRadiusPercent = 0.8
        view.transparentCircleRadiusPercent = 0.8
        return view
    }()
    
    let footmarkImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "icon_footmark")
        
        return view
    }()
    
    let footmarkTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "내가 찍은 발도장"
        label.font = .systemFont(ofSize: 10)
        label.adjustsFontSizeToFitWidth = true
        label.textColor = .nightBlackColor
        
        return label
    }()
    
    let footmarkCountLabel: UILabel = {
        let label = UILabel()
        label.text = "12"
        label.font = .boldSystemFont(ofSize: 48)
        label.textColor = .nightBlackColor
        
        return label
    }()
    
    let footmarkCountUnitLabel: UILabel = {
        let label = UILabel()
        label.text = "개"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .nightBlackColor
        
        return label
    }()
    
    let totalDistanceUnitLabel: UILabel = {
        let label = UILabel()
        label.text = "km"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .nightBlackColor
        
        return label
    }()
    
    let totalDistanceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "총 산책 거리"
        label.font = .systemFont(ofSize: 10)
        label.textColor = .nightBlackColor
        
        return label
    }()
    
    let totalDistanceValueLabel: UILabel = {
        let label = UILabel()
        label.text = "54"
        label.font = .boldSystemFont(ofSize: 48)
        label.textColor = .nightBlackColor
        
        return label
    }()
    
    let rightArrowImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "icon_right_arrow")
        
        return imgView
    }()
    
    // MARK: - Layout
    private func setupLayout() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 22
        
        self.addSubview(divisionView)
        divisionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.equalTo(0.5)
            make.center.equalToSuperview()
        }
        
        self.addSubview(pieChartView)
        pieChartView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(12)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(74)
        }
        
        pieChartView.addSubview(footmarkImageView)
        footmarkImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(22)
        }
        
        self.addSubview(footmarkTitleLabel)
        footmarkTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(divisionView.snp.top).offset(12)
            make.trailing.equalTo(divisionView.snp.leading).offset(-8)
        }
        
        self.addSubview(footmarkCountUnitLabel)
        footmarkCountUnitLabel.snp.makeConstraints { make in
            make.trailing.equalTo(divisionView.snp.leading).offset(-8)
            make.bottom.equalTo(divisionView.snp.bottom).offset(-20)
        }
        
        self.addSubview(footmarkCountLabel)
        footmarkCountLabel.snp.makeConstraints { make in
            make.trailing.equalTo(footmarkCountUnitLabel.snp.leading).offset(-12)
            make.bottom.equalTo(divisionView.snp.bottom).offset(-12)
        }
        
        self.addSubview(totalDistanceTitleLabel)
        totalDistanceTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(divisionView.snp.top).offset(12)
            make.leading.equalTo(divisionView.snp.trailing).offset(8)
        }
        
        self.addSubview(totalDistanceValueLabel)
        totalDistanceValueLabel.snp.makeConstraints { make in
            make.leading.equalTo(divisionView.snp.trailing).offset(12)
            make.bottom.equalTo(footmarkCountLabel.snp.bottom)
        }
        
        self.addSubview(totalDistanceUnitLabel)
        totalDistanceUnitLabel.snp.makeConstraints { make in
            make.leading.equalTo(totalDistanceValueLabel.snp.trailing).offset(12)
            make.bottom.equalTo(footmarkCountUnitLabel.snp.bottom)
        }
        
        self.addSubview(rightArrowImageView)
        rightArrowImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-28)
            make.width.equalTo(40)
            make.height.equalTo(8)
        }
    }
}
