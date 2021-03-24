//
//  JobScreen.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import SwiftUI

struct JobScreen: View {
    
    @EnvironmentObject private var navViewModel: NavControllerViewModel
    @ObservedObject var currentJobViewModel: CurrentJobViewModel
    
    init(job: Jobs?) {
        self.currentJobViewModel = CurrentJobViewModel(job: job)
    }
    
    var body: some View {
        VStack {
            FakeNavBar(label: self.currentJobViewModel.job?.title ?? "", backAction: {
                self.currentJobViewModel.removeJobId()
            })
            Spacer()
            Text(self.currentJobViewModel.job?.company ?? "")
                .font(.title)
                .padding()
            Text(self.currentJobViewModel.job?.trimmedDescription ?? "")
                .font(.body)
                .lineLimit(6)
                .padding(.top, 20)
                .padding(.leading, 20)
                .padding(.trailing, 20)
            HStack {
                Text("Email: \(self.currentJobViewModel.job?.url ?? "")")
                    .font(.footnote)
                    .padding(.leading, 20)
                Spacer()
            }
            Spacer()
        }.onAppear() {
            guard !self.currentJobViewModel.checkCurrentScreen() else { return }
        }
    }

}
