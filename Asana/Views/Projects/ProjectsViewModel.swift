//
//  ProjectsViewModel.swift
//  Asana
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation
import Combine
import AsanaApi

final class ProjectsViewModel: ObservableObject, UnidirectionalDataFlowType {
    enum InputType {
        case onAppear
    }
    func apply(_ input: InputType) {
        switch input {
        case .onAppear:
            if projects.count > 0 {
                return
            }
            isLoading = true
            onAppearSubject.send(())
        }
    }
    
    @Published private(set) var projects: [Project] = []
    @Published var isLoading = false
    
    private let apiService: ApiServiceType
    private let onAppearSubject = PassthroughSubject<Void, Never>()
    private var cancellables: [AnyCancellable] = []
    
    init(apiService: ApiServiceType) {
        self.apiService = apiService
        bind()
    }
    
    private func bind() {
        let request = ProjectsRequest()
        let responsePublisher = onAppearSubject
            .flatMap({ [apiService] _ in
                apiService.response(from: request).catch { error -> Empty<ProjectsResponse, Never> in
                    return .init()
                }
            })
            .map { $0.data }
        
        let projectsStream = responsePublisher
            .assign(to: \.projects, on: self)
        
        let stopLoadingStream = responsePublisher
            .map({ _ in
                return false
            })
            .assign(to: \.isLoading, on: self)
        
        cancellables += [
            projectsStream,
            stopLoadingStream
        ]
    }
}
