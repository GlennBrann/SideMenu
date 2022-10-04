/*
 * Copyright (c) 2022, Glenn Brannelly
 *
 * Licensed under BSD 3-Clause License.
 * https://opensource.org/licenses/BSD-3-Clause
 */

import Foundation
import SwiftUI

/// Icon + text + background
/// icon + background + x
/// tapping x resets selection
/// tapping open will open but keep selection

struct ItemView: View {
    var item: MenuItem
    var showTitle: Bool
    var alignment: HorizontalAlignment
    let style: SideMenuStyle
    
    @State private var timer: Timer? = nil
    @State private var firstAnim: Bool = true
    
    @Namespace private var selectedBackground
    private let backgroundId = "bg"
    
    private var animationOne: Bool {
        item.selected && firstAnim
    }
    
    private var animationTwo: Bool {
        !firstAnim && item.selected
    }
    
    init(
        item: MenuItem,
        showTitle: Bool,
        alignment: HorizontalAlignment,
        style: SideMenuStyle
    ) {
        self.item = item
        self.showTitle = showTitle
        self.alignment = alignment
        self.style = style
    }
    
    var body: some View {
        HStack(spacing: 8) {
            if alignment == .leading {
                iconView
                titleView
            } else if alignment == .trailing {
                titleView
                iconView
            }
        }
        .background(
            animationOne ?
            Capsule().fill(style.backgroundColor.opacity(0.75))
                .matchedGeometryEffect(id: backgroundId, in: selectedBackground)
            : nil
        )
        .transition(.opacity)
        .contentShape(Rectangle())
        .onChange(of: item) { item in
            stopTimer()
            startTimer()
        }
    }
    
    private var iconView: some View {
        Image(systemName: item.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24)
            .foregroundColor(animationTwo ? style.selectedForegroundColor : style.foregroundColor)
            .padding(10)
            .background(
                animationTwo ?
                Circle().fill(style.selectedBackgroundColor)
                    .matchedGeometryEffect(id: backgroundId, in: selectedBackground)
                : nil
            )
            .overlay(
                animationTwo ?
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color.black)
                    .background(Color.white)
                    .clipShape(Circle())
                    .offset(x: 16, y: 16)
                : nil
            )
    }
    
    @ViewBuilder
    private var titleView: some View {
        if showTitle || item.selected && firstAnim {
            Text(item.title)
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundColor(style.foregroundColor)
                .padding(alignment == .leading ? .trailing : .leading, 10)
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func startTimer() {
        firstAnim = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
            withAnimation(.easeInOut(duration: 0.15)) {
                firstAnim = false
            }
        }
    }
}
