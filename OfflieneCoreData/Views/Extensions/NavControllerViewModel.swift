//
//  NavControllerViewModel.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import SwiftUI

final public class NavControllerViewModel: ObservableObject {
    
    private let easing: Animation
    
    public var navigationType = NavType.push
    
    @Published public var currentScreen: Screen?
    
    private var screenStack = ScreenStack() {
        didSet {
            currentScreen = screenStack.top()
        }
    }
    
    public init(easing: Animation) {
        self.easing = easing
    }
    
    public func push<S: View>(_ screenView: S) {
        withAnimation(easing) {
            navigationType = .push
            let screen = Screen(id: UUID().uuidString, nextScreen: AnyView(screenView))
            screenStack.push(screen)
        }
    }
    
    public func pop(to: PopDestination = .previous) {
        withAnimation(easing) {
            navigationType = .pop
            switch to {
            case .root:
                screenStack.popToRoot()
            case .previous:
                screenStack.popToPrevious()
            }
        }
    }
}
