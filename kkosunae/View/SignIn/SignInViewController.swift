//
//  SignInViewController.swift
//  kkosunae
//
//  Created by 전현성 on 2023/09/19.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SignInViewController: UIViewController {
    private let viewModel = SignInViewModel()
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        bind()
    }
    
    private func bind() {
        let input = SignInViewModel.Input(
            tapKakaoLogin: kakaoLoginButton.rx.tap.asDriver()
        )
        let output = viewModel.transform(input: input)
        
        output.signInResponse
            .subscribe(onNext: { response in
                // TODO: - Sign in api
                if response {
                    // Already sign up
                    UIApplication.shared.windows.first?.rootViewController = TabBarController()
                } else {
                    // Go to sign up
                    UIApplication.shared.windows.first?.rootViewController = TabBarController()
                }
            })
            .disposed(by: disposeBag)
    }
    
    // View
    private let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    // Layout
    private func setupLayout() {
        self.view.backgroundColor = .white
        
        self.view.addSubview(kakaoLoginButton)
        kakaoLoginButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
