//
//  kkosunaeApp.swift
//  kkosunae
//
//  Created by 전현성 on 2023/06/01.
//

import SwiftUI
import ComposableArchitecture

@main
struct kkosunaeApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                store: Store(
                    initialState: RootDomain.State(),
                    reducer: RootDomain.live
                )
            )
        }
    }
}
