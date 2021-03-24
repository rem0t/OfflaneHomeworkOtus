//
//  FakeNavBar.swift
//  OfflieneCoreData
//
//  Created by Влад Калаев on 24.03.2021.
//

import SwiftUI

public struct FakeNavBar: View {
    
    @EnvironmentObject private var viewModel: NavControllerViewModel
    
    public let label: String
    public var backAction: (() -> Void)? = nil
    
    public var body: some View {
        HStack(alignment: .center, spacing: 20) {
            HStack {
                if viewModel.currentScreen != nil {
                    backView
                    .simultaneousGesture(TapGesture()
                        .onEnded {
                            self.viewModel.pop(to: .previous)
                            self.backAction?()
                        }
                    )
                    .padding(.top, UIDevice.current.hasNotch ? 40 : 20)
                }
                
            }
            .frame(width: 50, height: UIDevice.current.hasNotch ? 84 : 64)
            .background(Color("BackgroundMain"))
            .compositingGroup()
            .shadow(color: Color("BackgroundMain").opacity(0.2), radius: 0, x: 0, y: 2)
            Text(label)
                .foregroundColor(.primary)
                .font(Font.body.weight(.bold))
                .padding(.top, UIDevice.current.hasNotch ? 40 : 20)
            Spacer()
        }
    }
    
    public var backView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
                .opacity(0.02)
                .frame(width: 60, height: 60)
                .allowsHitTesting(false)
            HStack {
                Spacer()
                Image(systemName: "chevron.left")
                    .font(Font.system(size: 20).weight(.semibold))
                    .foregroundColor(.primary)
                Spacer()
            }
            .frame(width: 50, height: 50)
            .contentShape(Rectangle())
        }
    }
}
