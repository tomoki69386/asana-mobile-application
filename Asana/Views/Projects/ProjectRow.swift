//
//  ProjectRow.swift
//  Asana
//
//  Created by 築山朋紀 on 2020/07/08.
//

import SwiftUI

struct ProjectRow: View {
    
    @State var project: Project
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(project.name)
                .font(.system(size: 18, weight: .bold))
        }
        .padding(.init(top: 12, leading: 24, bottom: 12, trailing: 24))
        .foregroundColor(.primary)
    }
}

struct ProjectRow_Previews: PreviewProvider {
    static var previews: some View {
        ProjectRow(project: .stub)
    }
}
