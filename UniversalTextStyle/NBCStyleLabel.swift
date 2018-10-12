//
//  CustomStyleLabel.swift
//  UniversalTextStyle
//
//  Created by Tringapps-Admin on 13/08/18.
//  Copyright © 2018 Tringapps-Admin. All rights reserved.
//

import UIKit

// Able to customize - textStyle, colorStyle, isNeedToScale of label

@IBDesignable class NBCStyleLabel: UILabel {
    
    // MARK: - Text Style -
    
    fileprivate var textStyleType: NBCTextStyle = .none
    
    // Only for setting text tyle via storyboard
    
    @IBInspectable dynamic var textStyle: String {
        get {
            return textStyleType.rawValue
        }
        set {
            textStyleType = NBCTextStyle(rawValue: newValue) ?? .none
            configureTextStyle()
        }
    }
    
    // Only for setting text tyle via programmatic
    
    func setTextStyle(style: NBCTextStyle) {
        textStyleType = style
        configureTextStyle()
    }
    
    // MARK: - Text Color -
    
    fileprivate var textColorStyle: NBCColorStyle = .none
    
    // Only for setting text tyle via storyboard
    
    @IBInspectable dynamic var colorStyle: String {
        get {
            return textColorStyle.rawValue
        }
        set {
            textColorStyle = NBCColorStyle(rawValue: newValue) ?? .none
            configureTextColor()
        }
    }
    
    // Only for setting text tyle via programmatic
    
    func setTextColor(color: NBCColorStyle) {
        textColorStyle = color
        configureTextColor()
    }
    
    // MARK: - Text Size Scale -
    
    @IBInspectable dynamic var isScalable: Bool = false {
        didSet {
            configureTextStyle()
        }
    }
    
    // MARK: - Localise Text -
    
    @IBInspectable dynamic var localiseText: Bool = false {
        didSet {
            if localiseText {
//                self.text = NSString.getLocalisedText(self.text)
            }
        }
    }
    
    // MARK: - Text Upper Case -
    
    @IBInspectable dynamic var isUpperCase: Bool = false {
        didSet {
            if isUpperCase {
                self.text = self.text?.uppercased()
            }
        }
    }
    
    // MARK: - Helper method -
    
    private func configureTextStyle() {
        self.font = UIFont.getCustomFont(textStyleType, isScalable)
    }
    
    private func configureTextColor() {
        self.textColor = UIColor.getColor(textColorStyle)
    }
    
}

// MARK: - Color Style Configuration -

/*
 * NBCColorStyle can to be used in storyboard as well as programmatic *
 NBCStyleView | Property Name
 NBCStyleLabel | textColorType
 NBCStyleButton | textColorType
 NBCStyleTextView | textColorType
 */

enum NBCColorStyle: String {
    case highlightBlue
    case grayLight
    case textGrayLight
    case red
    case primaryBlue
    case grayMediumLight
    case textGrayMediumLight
    case broadcastBlue
    case grayMedium
    case textGrayMedium
    case weatherBlue
    case grayDark
    case textGrayDark
    case white
    case none
}

extension UIColor {
    
    static func getColor(_ customColor: NBCColorStyle) -> UIColor {
        switch customColor {
        case .highlightBlue:
            return #colorLiteral(red: 0.3082034588, green: 0.6913509369, blue: 0.9509388804, alpha: 1)
        case .grayLight:
            return #colorLiteral(red: 0.9719446301, green: 0.9719673991, blue: 0.9719551206, alpha: 1)
        case .textGrayLight:
            return #colorLiteral(red: 0.6588235294, green: 0.6588235294, blue: 0.6588235294, alpha: 1)
        case .red:
            return #colorLiteral(red: 0.8666666667, green: 0.1568627451, blue: 0.1607843137, alpha: 1)
        case .primaryBlue:
            return #colorLiteral(red: 0.0862745098, green: 0.2901960784, blue: 0.5058823529, alpha: 1)
        case .grayMediumLight:
            return #colorLiteral(red: 0.9058823529, green: 0.9058823529, blue: 0.9058823529, alpha: 1)
        case .textGrayMediumLight:
            return #colorLiteral(red: 0.5411764706, green: 0.5411764706, blue: 0.5411764706, alpha: 1)
        case .broadcastBlue:
            return #colorLiteral(red: 0.07058823529, green: 0.3490196078, blue: 0.6509803922, alpha: 1)
        case .grayMedium:
            return #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        case .textGrayMedium:
            return #colorLiteral(red: 0.3647058824, green: 0.3647058824, blue: 0.3647058824, alpha: 1)
        case .weatherBlue:
            return #colorLiteral(red: 0.2392156863, green: 0.4588235294, blue: 0.7254901961, alpha: 1)
        case .grayDark:
            return #colorLiteral(red: 0.7843137255, green: 0.7843137255, blue: 0.7843137255, alpha: 1)
        case .textGrayDark:
            return #colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        case .white:
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case .none:
            return #colorLiteral(red: 0.09019607843, green: 0.09019607843, blue: 0.09019607843, alpha: 1)
        }
    }
    
}

// MARK: - Font Style Configuration -

/*
 * NBCTextStyle can to be used in storyboard as well as programmatic *
 NBCStyleView | Property Name
 NBCStyleLabel | textStyleType
 NBCStyleButton | textStyleType
 NBCStyleTextView | textStyleType
 */

enum NBCTextStyle: String {
    // AI
    case navTitle
    case caption
    case tags
    case header4
    case emptyPage
    case none
}

enum NBCFontStyle: String {
    case robotoLight = "Roboto-Light"
    case robotoRegular = "Roboto-Regular"
    case robotoMedium = "Roboto-Medium"
    case robotoCondensedRegular = "RobotoCondensed-Regular"
}

extension UIFont {
    
    static func getCustomFont(_ textStyle: NBCTextStyle, _ isNeedToScale: Bool = false) -> UIFont {
        
        var scale = CGFloat(1.0)
        if isNeedToScale && UIDevice.current.userInterfaceIdiom == .phone {
            scale = UIScreen.main.bounds.width / 320.0
        }
        
        switch textStyle {
        case .navTitle: return UIFont(name: getFontName(.robotoCondensedRegular), size: 18.0 * scale) ?? getDefaultFont(18.0)
        case .caption: return UIFont(name: getFontName(.robotoRegular), size: 10.0) ?? getDefaultFont(10.0)
        case .tags: return UIFont(name: getFontName(.robotoMedium), size: 10.0) ?? getDefaultFont(10.0)
        case .header4: return UIFont(name: getFontName(.robotoRegular), size: 14.0) ?? getDefaultFont(14.0)
        case .emptyPage: return UIFont(name: getFontName(.robotoLight), size: 14.0) ?? getDefaultFont(14.0)
        default: return UIFont.systemFont(ofSize: 10.0)
        }
    }
    
    static func getDefaultFont(_ size: CGFloat = 10.0) -> UIFont {
        return UIFont.systemFont(ofSize: size)
    }
    
    static func getFontName(_ fontType: NBCFontStyle) -> String {
        switch fontType {
        case .robotoLight: return NBCFontStyle.robotoLight.rawValue
        case .robotoRegular: return NBCFontStyle.robotoRegular.rawValue
        case .robotoMedium: return NBCFontStyle.robotoMedium.rawValue
        case .robotoCondensedRegular: return NBCFontStyle.robotoCondensedRegular.rawValue
        }
    }
    
}
