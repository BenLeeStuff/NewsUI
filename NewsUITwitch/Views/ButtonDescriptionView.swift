//
//  ButtonDescriptionView.swift
//  NewsUITwitch
//
//  Created by Ben Lee on 9/5/19.
//  Copyright © 2019 Ben Lee. All rights reserved.
//

import UIKit

class ButtonDescriptionView: UIView {
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    let titleLabel : UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 12)
        l.textColor = .white
        l.textAlignment = .center
        return l
    }()

    override func layoutSubviews() {
        setupViews()
        
    }
    
    func setupViews() {
        self.layer.cornerRadius = 5
        self.layer.backgroundColor = UIColor.ACTIONBUTTONBACKGROUNDCOLOR().cgColor
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, width: 0, height: 14)
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
