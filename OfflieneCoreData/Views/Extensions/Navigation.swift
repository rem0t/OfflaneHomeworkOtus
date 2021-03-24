//
//  Navigation.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import SwiftUI

public enum NavTransiton {
    
    case none
    case custom(push: AnyTransition, pop: AnyTransition)
}

public enum NavType {
    
    case push
    case pop
}

public enum PopDestination {
    
    case previous
    case root
}
