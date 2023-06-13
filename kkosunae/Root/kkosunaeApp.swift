//
//  kkosunaeApp.swift
//  kkosunae
//
//  Created by 전현성 on 2023/06/01.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import ComposableArchitecture

@main
struct kkosunaeApp: App {
    init() {
        KakaoSDK.initSDK(appKey: Define.kakaoNativeAppKey)
    }
    
    var body: some Scene {
        WindowGroup {
            RootView(
                store: Store(
                    initialState: RootDomain.State(),
                    reducer: RootDomain()
                )
            )
            .onOpenURL { url in
                // Kakao 로그인 url인지 확인
                if (AuthApi.isKakaoTalkLoginUrl(url)) {
                    _ = AuthController.handleOpenUrl(url: url)
                }
            }
        }
    }
}
