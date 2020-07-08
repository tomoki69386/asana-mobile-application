//
//  ProjectsView.swift
//  Asana
//
//  Created by 築山朋紀 on 2020/07/08.
//

import SwiftUI
import AsanaApi

struct ProjectsView: View {
    
    @ObservedObject var viewModel: ProjectsViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    VStack {
                        Spacer()
                        ProgressView()
                        Spacer()
                    }
                } else {
                    List {
                        ForEach(viewModel.projects, id: \.gid) { project in
                            VStack(alignment: .leading) {
                                self.buildRow(project: project)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Asana"))
            .listStyle(GroupedListStyle())
        }
        .onAppear {
            self.viewModel.apply(.onAppear)
        }
    }
    
    func buildRow(project: Project) -> AnyView {
        let viewModel: ProjectTasksViewModel = .init(
            apiService: ApiService.init(),
            projectGid: project.gid,
            title: project.name)
        return AnyView(
            NavigationLink(
                destination: ProjectTasksView(viewModel: viewModel),
                label: {
                    ProjectRow(project: project)
                })
        )
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ProjectsView(viewModel: .init(apiService: ApiService()))
        }
    }
}
