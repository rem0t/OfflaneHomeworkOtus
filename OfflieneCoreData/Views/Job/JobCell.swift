//
//  JobCell.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import SwiftUI

struct JobCell: View {
    
    @State var title: String
    @State var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
                .lineLimit(3)
                .multilineTextAlignment(.leading)
            Text(description)
                .font(.callout)
            Spacer()
        }
        .frame(height: 64)
    }
}
