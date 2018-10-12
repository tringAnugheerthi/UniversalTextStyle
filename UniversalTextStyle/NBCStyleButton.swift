//
//  NBCStyleButton.swift
//  UniversalTextStyle
//
//  Created by Tringapps-Admin on 23/08/18.
//  Copyright © 2018 Tringapps-Admin. All rights reserved.
//

import UIKit

@IBDesignable class NBCStyleButton: UIButton {
    
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
                self.setTitle(self.titleLabel?.text?.uppercased(), for: .normal)
                self.setTitle(self.titleLabel?.text?.uppercased(), for: .selected)
            }
        }
    }
    
    // MARK: - Helper method -
    
    private func configureTextStyle() {
        self.titleLabel?.font = UIFont.getCustomFont(textStyleType, isScalable)
    }
    
    private func configureTextColor() {
        self.setTitleColor(UIColor.getColor(textColorStyle), for: .normal)
        self.setTitleColor(UIColor.getColor(textColorStyle), for: .selected)
    }
    
}
