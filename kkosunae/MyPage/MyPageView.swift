//
//  MyPageView.swift
//  kkosunae
//
//  Created by 전현성 on 2023/06/07.
//

import SwiftUI
import ComposableArchitecture

struct MyPageView: View {
    let store: StoreOf<MyPageDomain>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            Button("카카오 로그인") {
                viewStore.send(.tapKakaoLogin)
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
