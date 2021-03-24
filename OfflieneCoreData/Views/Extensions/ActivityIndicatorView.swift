//
//  ActivityIndicatorView.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import UIKit
import SwiftUI

public struct ActivityIndicatorView: UIViewRepresentable {
    
    public let style: UIActivityIndicatorView.Style
    
    public init(style: UIActivityIndicatorView.Style) {
        self.style = style
    }
    
    public func makeUIView(context: UIViewRepresentableContext<ActivityIndicatorView>) -> UIActivityIndicatorView {
        UIActivityIndicatorView(style: style)
    }
    
    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicatorView(style: .large)
    }
}
