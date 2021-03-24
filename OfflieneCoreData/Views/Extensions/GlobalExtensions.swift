//
//  GlobalExtensions.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import Foundation
import SwiftUI

extension UIDevice {
    
    var hasNotch: Bool {
        let bottom = UIApplication.shared.keyWindowInConnectedScenes?.safeAreaInsets.bottom ?? 0
        return bottom > 0
    }
}

extension UIApplication {
    
    var keyWindowInConnectedScenes: UIWindow? {
        return windows.first(where: { $0.isKeyWindow })
    }
}

extension RandomAccessCollection where Self.Element: Identifiable {
    
    public func isLast(_ item: Element) -> Bool {
        guard isEmpty == false else {
            return false
        }
        guard let itemIndex = lastIndex(where: { AnyHashable($0.id) == AnyHashable(item.id) }) else {
            return false
        }
        return distance(from: itemIndex, to: endIndex) == 1
    }
}
