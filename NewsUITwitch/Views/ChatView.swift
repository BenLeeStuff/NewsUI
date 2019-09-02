//
//  ChatView.swift
//  NewsUITwitch
//
//  Created by Ben Lee on 8/30/19.
//  Copyright © 2019 Ben Lee. All rights reserved.
//

import UIKit

class ChatView: UIView {
    
    let iconHeight: CGFloat = 44
    
    let underlyingView: UIView = {
        let v = UIView()
        v.backgroundColor =  UIColor.UNDERLYINGCELLCOLOR()
        v.layer.cornerRadius = 6
        return v
    }()
    
    let icon: UIImageView = {
        let v = UIImageView(image: UIImage(named: "chat.png"), highlightedImage: nil)
        v.contentMode = .scaleAspectFill
        v.layer.cornerRadius = 22
        return v
    }()
    
    let titleLabel: UILabel = {
        let l = UILabel()
        l.text = "Chat Messages"
        l.font = UIFont.boldSystemFont(ofSize: 16)
        l.textColor = UIColor.MAINTEXTCOLOR()
        l.textAlignment = .left
        return l
    }()
    
    let descriptionLabel: UILabel = {
        let l = UILabel()
        l.text = "Please open APP to view"
        l.font = UIFont.systemFont(ofSize: 12)
        l.textColor = UIColor.DESCRIPTEXTCOLOR()
        l.textAlignment = .left
        return l
    }()
    
    let timeLabel: UILabel = {
        let l = UILabel()
        l.text = Date().getTime()
        l.font = UIFont.systemFont(ofSize: 12)
        l.textColor = UIColor.DESCRIPTEXTCOLOR()
        l.textAlignment = .left
        return l
    }()
    
    let overlay: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    override func layoutSubviews() {
        setupViews()
    }
    
    func setupViews() {
        //underlyingView.isHidden = true
        addSubview(underlyingView)
        underlyingView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 5, paddingRight: 10, width: 0, height: 0)
        
        underlyingView.addSubview(icon)
        icon.anchor(top: topAnchor, left: underlyingView.leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 14, paddingLeft: 15, paddingBottom: 12, paddingRight: 0, width: iconHeight, height: iconHeight)
        
        underlyingView.addSubview(timeLabel)
        timeLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: underlyingView.rightAnchor, paddingTop: 18, paddingLeft: 0, paddingBottom: 0, paddingRight: 14, width: 32, height: 14)
        
        underlyingView.addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: icon.rightAnchor, bottom: nil, right: timeLabel.leftAnchor, paddingTop: 17, paddingLeft: 20, paddingBottom: 0, paddingRight: 10, width: 0, height: 18)
        
        underlyingView.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: icon.rightAnchor, bottom: nil, right: underlyingView.rightAnchor, paddingTop: 5, paddingLeft: 20, paddingBottom: 0, paddingRight: 12, width: 0, height: 14)
        
        addSubview(overlay)
        overlay.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    func decreaseOverlayAlpha() {
        

        
    }
}
