//
//  ActionView.swift
//  NewsUITwitch
//
//  Created by Ben Lee on 9/3/19.
//  Copyright © 2019 Ben Lee. All rights reserved.
//

import UIKit

class ShadowView: UIView {
    
    let shadowView: UIView = {
        let v = UIView()
        v.layer.backgroundColor = UIColor.SHADOWCOLOR().cgColor
        v.applyShadow(opacity: 0.2, radius: 15, offset: CGSize(width: 0, height: 10))
        return v
    }()
    
    override func layoutSubviews() {
        
    }
    
    func setShadow(opacity: Float, radius: CGFloat, offset: CGSize?) {
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowColor = UIColor.SHADOWCOLOR().cgColor
        if let offset = offset {
            layer.shadowOffset = offset
        }
    }
    
    func addViewInCenter(view: UIView, width: CGFloat, height: CGFloat) {
        self.addSubview(view)
        view.anchorCenter(centerY: centerYAnchor, centerX: centerXAnchor, paddingLeft: 0, paddingTop: 0, width: width, height: height)
    }
    
    func addViewWithAnchor(view: UIView, top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        self.addSubview(view)
        view.anchor(top: top, left: left, bottom: bottom, right: right, paddingTop: paddingTop, paddingLeft: paddingLeft, paddingBottom: paddingBottom, paddingRight: paddingRight, width: width, height: height)
    }
    
    func addview(view: UIButton) {
        self.addSubview(view)
        view.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    
    func addButtonInCenter(button: UIButton, width: CGFloat, height: CGFloat) {
        self.addSubview(button)
        button.anchorCenter(centerY: centerYAnchor, centerX: centerXAnchor, paddingLeft: 0, paddingTop: 0, width: width, height: height)
    }
    
    func addButtonWithAnchor(button: UIButton, top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        self.addSubview(button)
        button.anchor(top: top, left: left, bottom: bottom, right: right, paddingTop: paddingTop, paddingLeft: paddingLeft, paddingBottom: paddingBottom, paddingRight: paddingRight, width: width, height: height)
    }
    
    func addButton(button: UIButton) {
        self.addSubview(button)
        button.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
 

}
