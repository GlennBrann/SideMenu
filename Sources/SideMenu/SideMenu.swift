/*
 * Copyright (c) 2022, Glenn Brannelly
 *
 * Licensed under BSD 3-Clause License.
 * https://opensource.org/licenses/BSD-3-Clause
 */

import SwiftUI

public struct SideMenu: View {
    @StateObject var vm: MenuManager
    let style: SideMenuStyle
    
    @Binding var selectedItem: MenuItem?
    @Binding var alignment: HorizontalAlignment
    
    public var body: some View {
        ZStack {
            LinearGradient(
                colors: alignment == .leading ? [.black.opacity(0.7), .clear] : [.clear, .black.opacity(0.7)],
                startPoint: .leading,
                endPoint: .trailing
            )
            .opacity(vm.menuOpen ? 1 : 0)
            .animation(.easeInOut(duration: 0.25), value: vm.menuOpen)
            .onTapGesture { vm.onMenuToggled() }
            
            VStack(alignment: alignment, spacing: 4) {
                ForEach(vm.menuItems, id: \.id) { item in
                    ItemView(
                        item: item,
                        showTitle: vm.menuOpen,
                        alignment: alignment,
                        style: style
                    )
                    .onTapGesture {
                        vm.onMenuItemSelected(item)
                        hapticFeedback(style: .light)
                    }
                }
                
                if vm.showDisclosure {
                    HStack(spacing: 16) {
                        if alignment == .leading {
                            Image(systemName: "chevron.up")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .rotationEffect(.degrees(vm.menuOpen ? 0 : -180))
                            
                            if vm.menuOpen {
                                Text("Close")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .transition(.opacity.combined(with: .move(edge: .top)))
                            }
                        } else {
                            if vm.menuOpen {
                                Text("Close")
                                    .font(.footnote)
                                    .fontWeight(.semibold)
                                    .transition(.opacity.combined(with: .move(edge: .top)))
                            }
                            
                            Image(systemName: "chevron.up")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 20, height: 20)
                                .rotationEffect(.degrees(vm.menuOpen ? 0 : -180))
                        }
                    }
                    .foregroundColor(style.foregroundColor)
                    .padding(12)
                    .animation(.easeInOut(duration: 0.25), value: vm.menuOpen)
                    .onTapGesture {
                        vm.onMenuToggled()
                        hapticFeedback(style: .light)
                    }
                }
            }
            .padding(.horizontal, 16)
            .animation(.interpolatingSpring(stiffness: 500, damping: 30, initialVelocity: 10), value: vm.menuItems)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: alignment == .leading ? .leading : .trailing)
        }
        .edgesIgnoringSafeArea(.all)
        .overlay(SwapButton)
        .onReceive(vm.$selectedItem) { selectedItem = $0 }
    }
    
    @ViewBuilder
    private var SwapButton: some View {
        if vm.menuOpen {
            VStack(alignment: .leading) {
                Button(action: {
                    if alignment == .leading {
                        alignment = .trailing
                    } else {
                        alignment = .leading
                    }
                }) {
                    Image(systemName: "arrow.left.arrow.right")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(style.foregroundColor)
                }
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: alignment == .leading ? .leading : .trailing)
                .padding(24)
        }
    }
    
    private func hapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let impact = UIImpactFeedbackGenerator(style: style)
        impact.impactOccurred()
    }
}

// MARK: - Menu modifier extension

extension View {
    public func addInstaMenu(
        menuItems: [MenuItem],
        closedDisplayCount: Int,
        selectedItem: Binding<MenuItem?>,
        menuAlignment: Binding<HorizontalAlignment> = .constant(.leading)
    ) -> some View {
        ZStack {
            self
            
            SideMenu(
                vm: MenuManager(menuItems: menuItems, closedDisplayCount: closedDisplayCount),
                style: .init(),
                selectedItem: selectedItem,
                alignment: menuAlignment
            )
        }
    }
}
