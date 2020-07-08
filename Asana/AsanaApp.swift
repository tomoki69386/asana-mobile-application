//
//  AsanaApp.swift
//  Asana
//
//  Created by 築山朋紀 on 2020/07/08.
//

import SwiftUI
import AsanaApi

@main
struct AsanaApp: App {
    var body: some Scene {
        WindowGroup {
            ProjectsView(viewModel: .init(apiService: ApiService.init()))
        }
    }
}
