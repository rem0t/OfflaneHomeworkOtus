//
//  ContentView.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 18.03.2021.
//

import SwiftUI

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavControllerView(transition: .custom(push: .move(edge: .trailing), pop: .slide))  {
            JobsScreen()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
