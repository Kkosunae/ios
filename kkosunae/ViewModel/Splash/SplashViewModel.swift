//
//  SplashViewModel.swift
//  kkosunae
//
//  Created by 전현성 on 2023/10/02.
//

import Foundation
import RxSwift
import RxCocoa

class SplashViewModel: ViewModel {
    var disposeBag = DisposeBag()
    
    struct Input {
        let viewWillAppear: Driver<Void>
    }
    
    struct Output {
        let isLogin: Observable<Bool>
    }
    
    func transform(input: Input) -> Output {
        let isLogin = BehaviorSubject(value: false)
        
        // TODO: - Check Login
        input.viewWillAppear
            .asObservable()
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .subscribe(onNext: { _ in
                isLogin.onNext(false)
            })
            .disposed(by: disposeBag)
        
        return Output(isLogin: isLogin)
    }
}
