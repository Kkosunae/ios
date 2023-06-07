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
    }
    
    enum Tab {
        case map
        case myPage
    }
    
    enum Action: Equatable {
        case tapSelected(Tab)
    }
    
    var uuid: @Sendable () -> UUID
    
    static let live = Self(
        uuid: { UUID() }
    )
    
    var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .tapSelected(let tab):
                state.selectedTab = tab
                return .none
            }
        }
    }
}
