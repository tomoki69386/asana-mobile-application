//
//  ProjectTaskRow.swift
//  Asana
//
//  Created by 築山朋紀 on 2020/07/08.
//

import SwiftUI

struct ProjectTaskRow: View {
    
    @State var task: Task
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(task.name)
                .font(.system(size: 18, weight: .bold))
        }
        .padding(.init(top: 12, leading: 24, bottom: 12, trailing: 24))
        .foregroundColor(.primary)
    }
}

struct ProjectTaskRow_Previews: PreviewProvider {
    static var previews: some View {
        ProjectTaskRow(task: .stub)
    }
}
