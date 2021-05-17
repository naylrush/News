//
//  OrientationPadding.swift
//  News
//
//  Created by Alexey Davletshin on 17.05.2021.
//

import SwiftUI

struct OrientationPadding: ViewModifier {
    let checkOrientation: Bool
    
    @Environment(\.horizontalSizeClass) var sizeClass
    
    init(_ checkOrientation: Bool = true) {
        self.checkOrientation = checkOrientation
    }
    
    func body(content: Content) -> some View {
        content
        .padding(.horizontal, checkOrientation && sizeClass == .regular ? UIScreen.main.bounds.width / 6 : 0)
    }
}
