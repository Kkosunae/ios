//
//  MyPageDomain.swift
//  kkosunae
//
//  Created by 전현성 on 2023/06/08.
//

import Foundation
import ComposableArchitecture
import KakaoSDKAuth
import KakaoSDKUser
import AuthenticationServices

struct MyPageDomain: ReducerProtocol {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        case tapKakaoLogin
        case tapAppleLogin
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .tapKakaoLogin:
            kakaoLogin()
            return .none
        case .tapAppleLogin:
            return .none
        }
    }
    
    private func kakaoLogin() {
        // 카카오톡 실행 가능 여부 확인
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    //do something
                    _ = oauthToken
                }
            }
        }
    }
    
    private func appleLogin() {
        
    }
}
