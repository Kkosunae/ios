//
//  RootDomain.swift
//  kkosunae
//
//  Created by 전현성 on 2023/06/07.
//

import Foundation
import ComposableArchitecture

struct RootDomain: ReducerProtocol {
    struct State: Equatable {
        var selectedTab = Tab.map
        var myPageState = MyPageDomain.State()
    }
    
    enum Tab {
        case map
        case myPage
    }
    
    enum Action: Equatable {
        case tapSelected(Tab)
        case myPage(MyPageDomain.Action)
    }
    
    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .tapSelected(let tab):
            state.selectedTab = tab
            return .none
        case .myPage:
            return .none
        }
    }
}
