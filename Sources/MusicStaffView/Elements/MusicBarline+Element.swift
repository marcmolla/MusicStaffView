//
//  MusicBarline+Element.swift
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

public enum MusicBarline: Sendable {
    case single
    case double
    case final
}

extension MusicBarline: MusicStaffViewElement {
    public func path(in frame: CGRect) -> CGPath {
        let path = CGMutablePath()
        let lineWidth: CGFloat = frame.width * 0.1
        
        switch self {
        case .single:
            let rect = CGRect(x: frame.midX - lineWidth/2, y: frame.minY, width: lineWidth, height: frame.height)
            path.addRect(rect)
            
        case .double:
            let spacing = frame.width * 0.2
            let rect1 = CGRect(x: frame.midX - spacing - lineWidth/2, y: frame.minY, width: lineWidth, height: frame.height)
            let rect2 = CGRect(x: frame.midX + spacing - lineWidth/2, y: frame.minY, width: lineWidth, height: frame.height)
            path.addRect(rect1)
            path.addRect(rect2)
            
        case .final:
            let thinWidth = lineWidth
            let thickWidth = lineWidth * 2.5
            let spacing = frame.width * 0.15
            let rect1 = CGRect(x: frame.midX - spacing - thinWidth/2, y: frame.minY, width: thinWidth, height: frame.height)
            let rect2 = CGRect(x: frame.midX + spacing - thickWidth/2, y: frame.minY, width: thickWidth, height: frame.height)
            path.addRect(rect1)
            path.addRect(rect2)
            
        default:
            let rect = CGRect(x: frame.midX - lineWidth/2, y: frame.minY, width: lineWidth, height: frame.height)
            path.addRect(rect)
        }
        
        return path
    }
    
    public var aspectRatio: CGFloat {
        return 0.15
    }
    
    public var heightInStaffSpace: CGFloat {
        return 4.0
    }
}
