//
//  SignInViewModel.swift
//  kkosunae
//
//  Created by 전현성 on 2023/10/02.
//

import Foundation
import RxSwift
import RxCocoa

class SignInViewModel: ViewModel {
    var disposeBag = DisposeBag()
    
    struct Input {
        let tapKakaoLogin: Driver<Void>
        let tapAppleLogin: Driver<Void>
    }
    
    struct Output {
        // TODO: - Sign in api
        let signInResponse: Observable<Bool>
    }
    
    func transform(input: Input) -> Output {
        let signInService = SignInService()
        let signInResponse = PublishSubject<Bool>()
        
        input.tapKakaoLogin
            .asObservable()
            .subscribe(onNext: { _ in
                signInService.signInKakao()
            }, onError: { error in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
        
        input.tapAppleLogin
            .asObservable()
            .subscribe(onNext: { _ in
                signInService.signInApple()
            }, onError: { error in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
        
        signInService.signInResponse
            .asObservable()
            .subscribe(onNext: { response in
                print("token = \(response.accessToken)")
                signInResponse.onNext(true)
            }, onError: { error in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
        
        return Output(signInResponse: signInResponse.asObservable())
    }
}
