//
//  ViewModel.swift
//  kkosunae
//
//  Created by 전현성 on 2023/10/02.
//

import Foundation
import RxSwift

protocol ViewModel {
    associatedtype Input
    associatedtype Output
    
    var disposeBag: DisposeBag { get set }
    
    func transform(input: Input) -> Output
}
