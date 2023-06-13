//
//  MyPageView.swift
//  kkosunae
//
//  Created by 전현성 on 2023/06/07.
//

import SwiftUI
import ComposableArchitecture
import AuthenticationServices

struct MyPageView: View {
    let store: StoreOf<MyPageDomain>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Button("카카오 로그인") {
                    viewStore.send(.tapKakaoLogin)
                }
                
                SignInWithAppleButton { (request) in
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { (result) in
                    switch result {
                    case .success(let user):
                        print("success")
                        guard let credential = user.credential as? ASAuthorizationAppleIDCredential else {
                            print("error with firebase")
                            return
                        }
                        print("email = \(credential.email)")
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView(
            store: Store(initialState: MyPageDomain.State(),
                         reducer: MyPageDomain())
        )
    }
}
