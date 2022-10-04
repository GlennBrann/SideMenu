/*
 * Copyright (c) 2022, Glenn Brannelly
 *
 * Licensed under BSD 3-Clause License.
 * https://opensource.org/licenses/BSD-3-Clause
 */

import Foundation
import SwiftUI

public class MenuManager: ObservableObject {
    @Published public var menuItems: [MenuItem]
    @Published public var selectedItem: MenuItem? = nil
    @Published public var menuOpen: Bool = false
    
    private var initialMenuItems: [MenuItem]
    private var closedDisplayCount: Int
    
    @Published public var showDisclosure: Bool
    
    public init(
        menuItems: [MenuItem],
        closedDisplayCount: Int
    ) {
        self.menuItems = menuItems
        self.initialMenuItems = menuItems
        self.closedDisplayCount = closedDisplayCount
        
        self.showDisclosure = closedDisplayCount < menuItems.count - 1
        setMenuItems(Array(initialMenuItems.prefix(closedDisplayCount)), selected: false)
    }
    
    func onMenuItemSelected(_ menuItem: MenuItem) {
        var menuItem = menuItem
        menuItem.selected = !menuItem.selected
        if menuItem.selected {
            selectedItem = menuItem
            menuItems = [menuItem]
        } else {
            setMenuItems(Array(initialMenuItems.prefix(closedDisplayCount)), selected: false)
            selectedItem = nil
        }
        menuOpen = false
    }
    
    func onMenuToggled() {
        menuOpen = !menuOpen
        if menuOpen {
            setMenuItems(initialMenuItems)
        } else {
            if let selectedItem = selectedItem {
                menuItems = [selectedItem]
            } else {
                setMenuItems(Array(initialMenuItems.prefix(closedDisplayCount)))
            }
        }
    }
    
    private func setMenuItems(_ items: [MenuItem], selected: Bool = true) {
        var items = items
        items = items.compactMap { item in
            var item = item
            if let menuItem = selectedItem, item.id == menuItem.id {
                item.selected = selected
            }
            return item
        }
        menuItems = items
    }
}
