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
        let path = CGMutablePath()
        
        // Draw top number (beats)
        let topY = frame.minY + frame.height * 0.25
        drawNumber(beats, in: CGRect(x: frame.minX, y: topY, width: frame.width, height: frame.height * 0.25), to: path)
        
        // Draw bottom number (base rhythm as number)
        let bottomY = frame.minY + frame.height * 0.55
        let denominator = baseRhythm.denominator
        drawNumber(denominator, in: CGRect(x: frame.minX, y: bottomY, width: frame.width, height: frame.height * 0.25), to: path)
        
        return path
    }
    
    private func drawNumber(_ number: Int, in rect: CGRect, to path: CGMutablePath) {
        let numberString = "\(number)" as NSString
        let font = CTFontCreateWithName("Times New Roman" as CFString, rect.height, nil)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let size = numberString.size(withAttributes: attributes)
        let x = rect.midX - size.width / 2
        let y = rect.midY - size.height / 2
        
        if let letters = CTFontCreatePathForGlyph(font, CTFontGetGlyphWithName(font, numberString as CFString), nil) {
            var transform = CGAffineTransform(translationX: x, y: y)
            path.addPath(letters, transform: transform)
        }
    }
    
    public var aspectRatio: CGFloat {
        return 0.6
    }
    
    public var heightInStaffSpace: CGFloat {
        return 4.0
    }
}

extension MusicRhythm {
    var denominator: Int {
        switch self {
        case .whole: return 1
        case .half: return 2
        case .quarter: return 4
        case .eighth: return 8
        case .sixteenth: return 16
        case .thirtySecond: return 32
        case .sixtyFourth: return 64
        default: return 4
        }
    }
}
