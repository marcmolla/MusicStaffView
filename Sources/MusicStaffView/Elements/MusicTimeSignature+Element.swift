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
        // Si es 4/4, dibuja el símbolo C
        if beats == 4 && baseRhythm == .quarter {
            return commonTimePath(in: frame)
        }
        return CGPath(rect: .zero, transform: nil)
    }
    
    private func commonTimePath(in frame: CGRect) -> CGPath {
        let path = CGMutablePath()
        let center = CGPoint(x: frame.midX, y: frame.midY)
        let radius = min(frame.width, frame.height) * 0.4
        let lineWidth = radius * 0.15
        
        // Dibuja un arco en forma de C
        path.addArc(center: center, radius: radius, startAngle: .pi * 0.6, endAngle: .pi * 1.4, clockwise: false)
        
        return path.copy(strokingWithWidth: lineWidth, lineCap: .round, lineJoin: .round, miterLimit: 0)
    }
    
    public var aspectRatio: CGFloat {
        return 0.8
    }
    
    public var heightInStaffSpace: CGFloat {
        return 3.0
    }
}
