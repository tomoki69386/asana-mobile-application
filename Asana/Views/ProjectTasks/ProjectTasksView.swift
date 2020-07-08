//
//  ProjectTasksView.swift
//  Asana
//
//  Created by 築山朋紀 on 2020/07/08.
//

import SwiftUI
import AsanaApi

struct ProjectTasksView: View {
    
    @ObservedObject var viewModel: ProjectTasksViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                VStack {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
            } else {
                List {
                    ForEach(viewModel.tasks, id: \.gid) { task in
                        VStack(alignment: .leading) {
                            self.buildRow(task: task)
                        }
                    }
                }
            }
        }
        .navigationBarTitle(Text(viewModel.title))
        .onAppear {
            self.viewModel.apply(.onAppear)
        }
    }
    
    func buildRow(task: Task) -> AnyView {
        return AnyView(ProjectTaskRow(task: task))
    }
}

struct ProjectTasksView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectTasksView(viewModel: .init(
                            apiService: ApiService.init(),
                            projectGid: "1175336825694067",
                            title: "Sample"))
    }
}
