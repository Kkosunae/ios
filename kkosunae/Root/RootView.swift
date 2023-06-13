//
//  RootView.swift
//  kkosunae
//
//  Created by 전현성 on 2023/06/01.
//

import SwiftUI
import ComposableArchitecture

struct RootView: View {
    let store: StoreOf<RootDomain>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            TabView(
                selection: viewStore.binding(
                    get: \.selectedTab,
                    send: RootDomain.Action.tapSelected
                )
            ) {
                MapView()
                    .tabItem {
                        Image(systemName: "map")
                        Text("지도")
                    }
                    .tag(RootDomain.Tab.map)
                
                MyPageView(
                    store: Store(initialState: MyPageDomain.State(),
                                 reducer: MyPageDomain())
                )
                .tabItem {
                    Image(systemName: "person")
                    Text("마이페이지")
                }
                .tag(RootDomain.Tab.myPage)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(
            store: Store(
                initialState: RootDomain.State(),
                reducer: RootDomain()
            )
        )
    }
}
