//
//  MusicTimeSignature+Element.swift
//  MusicStaffView
//

#if os(macOS)
import Cocoa
#elseif os(iOS)
import UIKit
#endif

import Foundation
import Music
import SwiftUI

extension MusicTimeSignature: MusicStaffViewElement {
    public func path(in frame: CGRect) -> CGPath {
        CGPath(rect: .zero, transform: nil)
    }
    
    public var aspectRatio: CGFloat {
        return 0.6
    }
    
    public var heightInStaffSpace: CGFloat {
        return 4.0
    }
}
