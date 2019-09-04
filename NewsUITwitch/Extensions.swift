//
//  Extensions.swift
//  NewsUITwitch
//
//  Created by Ben Lee on 8/30/19.
//  Copyright © 2019 Ben Lee. All rights reserved.

import Foundation
import UIKit

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let right = right {
            self.rightAnchor.constraint(equalTo: right, constant: -1 * paddingRight).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom, constant: -1 * paddingBottom).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func anchorCenter(centerY: NSLayoutYAxisAnchor?, centerX: NSLayoutXAxisAnchor?, paddingLeft: CGFloat, paddingTop: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerY = centerY {
            self.centerYAnchor.constraint(equalTo: centerYAnchor, constant: paddingTop).isActive = true
        }
        
        if let centerX = centerX {
            self.centerXAnchor.constraint(equalTo: centerXAnchor, constant: paddingLeft).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func setShadow() {
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 1.5
    }
    
    func applyShadow(opacity: Float, radius: CGFloat, offset: CGSize?) {
        layer.shadowColor = UIColor.SHADOWCOLOR().cgColor
        layer.shadowOpacity = opacity
        
        if let offset = offset {
            layer.shadowOffset = offset
        }
        layer.shadowRadius = radius
    }
    
}

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor{
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func BACKGROUNDCOLOR() -> UIColor {
        return UIColor.rgb(red: 239, green: 243, blue: 248)
    }
    
    static func MAINTEXTCOLOR() -> UIColor {
        return UIColor.rgb(red: 28, green: 28, blue: 28)
    }
    
    static func DESCRIPTEXTCOLOR() -> UIColor {
        return UIColor.rgb(red: 160, green: 160, blue: 160)
    }
    
    static func UNDERLYINGCELLCOLOR() -> UIColor {
        return UIColor.rgb(red: 244, green: 245, blue: 247)
    }
    
    static func SHADOWCOLOR() -> UIColor {
        return UIColor.rgb(red: 180, green: 180, blue: 202)
    }
    
    static func ACTIONBUTTONBACKGROUNDCOLOR() -> UIColor {
        return UIColor.rgb(red: 51, green: 59, blue: 75)
    }
    
    //let backgroundColor: UIColor = UIColor(red: 239, green: 243, blue: 248, alpha: 1)
}

extension Date {
    func getTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        let hour = String(calendar.component(.hour, from: date))
        let min = String(calendar.component(.minute, from: date))
        
        let time = "\(hour):\(min)"
        return time
    }
}


