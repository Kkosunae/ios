//
//  SignInService.swift
//  kkosunae
//
//  Created by 전현성 on 2023/10/02.
//

import Foundation
import KakaoSDKUser
import RxSwift

class SignInService {
    static func signInKakao() -> Observable<SignInRequest> {
        return Observable.create { emitter in
            // isKakaoTalkLoginAvailable() : 카톡 설치 되어있으면 true
            if (UserApi.isKakaoTalkLoginAvailable()) {
                UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                    if let error = error {
                        emitter.onError(error)
                    }
                    print("Success kakao talk login")
                    
                    if let oauthToken = oauthToken {
                        emitter.onNext(SignInRequest(accessToken: oauthToken.accessToken))
                        emitter.onCompleted()
                    }
                }
            } else {
                UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                    if let error = error {
                        emitter.onError(error)
                    }
                    print("Success kakao account login")
                    
                    if let oauthToken = oauthToken {
                        emitter.onNext(SignInRequest(accessToken: oauthToken.accessToken))
                        emitter.onCompleted()
                    }
                }
            }
            
            return Disposables.create()
        }
    }
}
