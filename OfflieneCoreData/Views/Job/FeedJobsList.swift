//
//  FeedJobsList.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 18.03.2021.
//

import SwiftUI

struct FeedJobsList: View {
    
    @ObservedObject var viewModel: JobsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.jobList) { job in
                JobCell(
                    title: job.title ?? "",
                    description: "Company: \(job.company ?? "")") .onAppear() {
                        if self.viewModel.jobList.isLast(job) {
                        self.viewModel.upGreatPage()
                        self.viewModel.fetchJobs()
                    }
                }
            }
            if viewModel.isPageLoading {
                ActivityIndicatorView(style: .medium)
                    .frame(idealWidth: .infinity, maxWidth: .infinity, alignment: .center)
            }
        }
    }
}
