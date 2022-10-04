/*
 * Copyright (c) 2022, Glenn Brannelly
 *
 * Licensed under BSD 3-Clause License.
 * https://opensource.org/licenses/BSD-3-Clause
 */

import Foundation

public struct MenuItem: Equatable, Identifiable {
    public let id: String
    public let title: String
    public let image: String
    public var selected: Bool
    
    public init(
        id: String,
        title: String,
        image: String,
        selected: Bool
    ) {
        self.id = id
        self.title = title
        self.image = image
        self.selected = selected
    }
}
