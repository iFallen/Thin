//
//  UIFont+Thin.swift
//  Thin
//
//  Created by JuanFelix on 2019/12/31.
//

import Foundation

public enum FontNameType {
    case title, body
}

extension Thin where Base: UIFont {
    // MARK: - FontName
    public static var titleFontName: String? {
        return ThinConfig.titleFontName
    }
    
    public static var bodyFontName: String? {
        return ThinConfig.bodyFontName
    }
    ///Title Font Size
    public static var titleFontSize: CGFloat {
        return ThinConfig.titleFontSize
    }
    ///Body Font Size
    public static var bodyFontSize: CGFloat {
        return ThinConfig.bodyFontSize
    }
    ///mark Font Size
    public static var markFontSize: CGFloat {
        return ThinConfig.markFontSize
    }

    
    public static func font(_ type: FontNameType,
                            size: CGFloat,
                            fix: CGFloat = 0) -> UIFont {
        switch type {
            case .title:
                return title(size: size, fix: fix)
            case .body:
                return body(size: size, fix: fix)
        }
    }
    
    public static func title(size: CGFloat = ThinConfig.titleFontSize,
                             fix: CGFloat = 0) -> UIFont {
        if let name = ThinConfig.titleFontName, let font = UIFont(name: name, size: size + fix) {
            return font
        }
        return UIFont.systemFont(ofSize: size + fix)
    }
    
    public static func body(size: CGFloat = ThinConfig.bodyFontSize,
                             fix: CGFloat = 0) -> UIFont {
        if let name = ThinConfig.bodyFontName, let font = UIFont(name: name, size: size + fix) {
            return font
        }
        return UIFont.systemFont(ofSize: size + fix)
    }
    
    public static func mark(size: CGFloat = ThinConfig.markFontSize,
                             fix: CGFloat = 0) -> UIFont {
        if let name = ThinConfig.bodyFontName, let font = UIFont(name: name, size: size + fix) {
            return font
        }
        return UIFont.systemFont(ofSize: size + fix)
    }
}


public enum PFFontWeight: String {
    case thin       =   "PingFangSC-Thin"
    case light      =   "PingFangSC-Light"
    case ultralight =   "PingFangSC-Ultralight"
    case regular    =   "PingFangSC-Regular"
    case medium     =   "PingFangSC-Medium"
    case semibold   =   "PingFangSC-Semibold"
}

extension Thin where Base: UIFont {
    public static func pfFont(_ weight: PFFontWeight, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: weight.rawValue, size: size) else {
            if weight == .medium || weight == .semibold {
                return UIFont.boldSystemFont(ofSize: size)
            }
            return UIFont.systemFont(ofSize: size)
        }
        return font
    }
}
