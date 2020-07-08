//
//  ProjectTasksViewModel.swift
//  Asana
//
//  Created by 築山朋紀 on 2020/07/08.
//

import Foundation
import Combine
import AsanaApi

final class ProjectTasksViewModel: ObservableObject, UnidirectionalDataFlowType {
    enum InputType {
        case onAppear
    }
    
    func apply(_ input: InputType) {
        switch input {
        case .onAppear:
            if tasks.count > 0 {
                return
            }
            isLoading = true
            onAppearSubject.send(())
        }
    }
    
    @Published private(set) var tasks: [Task] = []
    @Published var isLoading = false
    
    private(set) var title: String
    private let apiService: ApiServiceType
    private let onAppearSubject = PassthroughSubject<Void, Never>()
    private var cancellables: [AnyCancellable] = []
    
    init(apiService: ApiServiceType, projectGid: String, title: String) {
        self.apiService = apiService
        self.title = title
        bind(projectGid: projectGid)
    }
    
    private func bind(projectGid: String) {
        let request = ProjectTasksRequest(projectGid: projectGid)
        let responsePublisher = onAppearSubject
            .flatMap({ [apiService] _ in
                apiService.response(from: request).catch { error -> Empty<ProjectTasksResponse, Never> in
                    return .init()
                }
            })
            .map { $0.data }
        
        let projectsStream = responsePublisher
            .assign(to: \.tasks, on: self)
        
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
