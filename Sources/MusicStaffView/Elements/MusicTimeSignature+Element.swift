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
import SVGParser

extension MusicTimeSignature: MusicStaffViewElement {
    public func path(in frame: CGRect) -> CGPath {
        if beats == 4 && baseRhythm == .quarter {
            return Self.commonTimePath
        }
        return CGPath(rect: .zero, transform: nil)
    }
    
    static let commonTimePath: CGPath = {
        try! SVGSingleElementContent(forResource: "opusCommonTime", withExtenstion: "svg").path!
    }()
    
    public var aspectRatio: CGFloat {
        return 1.0
    }
    
    public var heightInStaffSpace: CGFloat {
        return 3.0
    }
}
