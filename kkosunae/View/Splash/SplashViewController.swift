//
//  SplashViewController.swift
//  kkosunae
//
//  Created by 전현성 on 2023/09/19.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class SplashViewController: UIViewController {
    private let viewModel = SplashViewModel()
    private var disposeBag = DisposeBag()
    
    private var viewWillAppear = PublishSubject<Void>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // TODO: - Splash
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppear.onNext(())
    }
    
    private func bind() {
        let input = SplashViewModel.Input(viewWillAppear: viewWillAppear.asDriver(onErrorJustReturn: ()))
        let output = viewModel.transform(input: input)
        
        output.isLogin
            .subscribe(onNext: { [weak self] result in
                if result {
                    // Success login
                    self?.moveToTabBarController()
                } else {
                    // Fail login
                    self?.moveToSigninViewController()
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func moveToTabBarController() {
        UIApplication.shared.windows.first?.rootViewController = TabBarController()
    }
    
    private func moveToSigninViewController() {
        UIApplication.shared.windows.first?.rootViewController = SignInViewController()
    }
}

