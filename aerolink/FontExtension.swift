//
//  FontExtension.swift
//  aerolink
//
//  Created by asadbek on 23/09/24.
//

import SwiftUI

extension Font {
    static func customSize(_ size: Int, weight: Font.Weight = .regular) -> Font {
        return .system(size: CGFloat(size), weight: weight)
    }
}
