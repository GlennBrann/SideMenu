/*
 * Copyright (c) 2022, Glenn Brannelly
 *
 * Licensed under BSD 3-Clause License.
 * https://opensource.org/licenses/BSD-3-Clause
 */

import Foundation
import SwiftUI

public struct SideMenuStyle {
    let backgroundColor: Color
    let selectedBackgroundColor: Color
    let foregroundColor: Color
    let selectedForegroundColor: Color
    
    public init(
        backgroundColor: Color = .black,
        selectedBackgroundColor: Color = .white,
        foregroundColor: Color = .white,
        selectedForegroundColor: Color = .pink
    ) {
        self.backgroundColor = backgroundColor
        self.selectedBackgroundColor = selectedBackgroundColor
        self.foregroundColor = foregroundColor
        self.selectedForegroundColor = selectedForegroundColor
    }
}
