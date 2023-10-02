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
    }
    
    struct Output {
        // TODO: - Sign in api
        let signInResponse: Observable<Bool>
    }
    
    func transform(input: Input) -> Output {
        let signInResponse = PublishSubject<Bool>()
        
        input.tapKakaoLogin
            .asObservable()
            .flatMap { SignInService.signInKakao() }
            .subscribe(onNext: { response in
                print(response.accessToken)
                signInResponse.onNext(true)
            }, onError: { error in
                print(error.localizedDescription)
            })
            .disposed(by: disposeBag)
        return Output(signInResponse: signInResponse.asObservable())
    }
}
