//
//  SignUpViewModel.swift
//  kkosunae
//
//  Created by 전현성 on 2023/10/03.
//

import Foundation
import RxSwift
import RxCocoa

class SignUpViewModel: ViewModel {
    var disposeBag = DisposeBag()
    
    struct Input {
        let tapNextButton: Driver<Void>
    }
    
    struct Output {
        let isSuccessRestration: Observable<Bool>
    }
    
    func transform(input: Input) -> Output {
        let isSuccessRestration = PublishSubject<Bool>()
        
        input.tapNextButton
            .asObservable()
            .subscribe(onNext: { _ in
                isSuccessRestration.onNext(true)
            })
            .disposed(by: disposeBag)
        
        return Output(isSuccessRestration: isSuccessRestration.asObservable())
    }
}
