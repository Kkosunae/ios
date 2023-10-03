//
//  SignUpViewController.swift
//  kkosunae
//
//  Created by 전현성 on 2023/10/03.
//

import UIKit
import SnapKit
import RxSwift

class SignUpViewController: UIViewController {
    let viewModel = SignUpViewModel()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        bind()
    }
    
    private func bind() {
        let input = SignUpViewModel.Input(
            tapNextButton: nextButton.rx.tap.asDriver()
        )
        let output = viewModel.transform(input: input)
        
        output.isSuccessRestration
            .subscribe(onNext: { result in
                UIApplication.shared.windows.first?.rootViewController = TabBarController()
            })
            .disposed(by: disposeBag)
    }
    
    // View
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "내 정보 등록"
        
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("다음", for: .normal)
        
        return button
    }()
    
    // Layout
    private func setupLayout() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        self.view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(12)
        }
    }
}
