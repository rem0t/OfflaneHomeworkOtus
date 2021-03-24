//
//  MainJobList.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 18.03.2021.
//

import SwiftUI

struct JobsScreen: View {
    
    @EnvironmentObject var viewModel: JobsViewModel
    @EnvironmentObject var navViewModel: NavControllerViewModel
    
    var body: some View {
        VStack {
            FeedJobsList(viewModel: viewModel)
        } .onAppear() {
            guard !self.viewModel.checkOpeningScreen() else { return }
        }
    }
}

struct JobsScreen_Previews: PreviewProvider {
    static var previews: some View {
        JobsScreen()
    }
}
