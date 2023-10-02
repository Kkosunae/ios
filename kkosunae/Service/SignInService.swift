//
//  SignInService.swift
//  kkosunae
//
//  Created by 전현성 on 2023/10/02.
//

import AuthenticationServices
import KakaoSDKUser
import Foundation
import RxSwift

class SignInService: NSObject {
    let signInResponse = PublishSubject<SignInRequest>()
    
    func signInKakao() {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    self.signInResponse.onError(error)
                }
                print("Success kakao talk login")
                
                if let oauthToken = oauthToken {
                    self.signInResponse.onNext(SignInRequest(accessToken: oauthToken.accessToken))
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    self.signInResponse.onError(error)
                }
                print("Success kakao account login")
                
                if let oauthToken = oauthToken {
                    self.signInResponse.onNext(SignInRequest(accessToken: oauthToken.accessToken))
                }
            }
        }
        
    }
    
    func signInApple() {
        let provider = ASAuthorizationAppleIDProvider()
        let request = provider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let controller = ASAuthorizationController(authorizationRequests: [request])
        controller.delegate = self
        controller.performRequests()
    }
}

extension SignInService: ASAuthorizationControllerDelegate {
    
    // Success apple login
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let credential = authorization.credential as? ASAuthorizationAppleIDCredential,
           let identityToken = credential.identityToken,
           let tokenString = String(data: identityToken, encoding: .utf8) {
            print("Success apple login")
            signInResponse.onNext(SignInRequest(accessToken: tokenString))
        }
    }
    
    // Fail apple login
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("Fail apple login")
        signInResponse.onError(error)
    }
}
