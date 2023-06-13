//
//  MyPageDomain.swift
//  kkosunae
//
//  Created by 전현성 on 2023/06/08.
//

import Foundation
import ComposableArchitecture

struct MyPageDomain: ReducerProtocol {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        case tapKakaoLogin
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .tapKakaoLogin:
            print("tap kakao login!!")
            return .none
        }
    }
}
