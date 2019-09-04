//
//  ActionButton.swift
//  NewsUITwitch
//
//  Created by Ben Lee on 9/3/19.
//  Copyright © 2019 Ben Lee. All rights reserved.
//

import UIKit

class ActionButton: UIButton {
    
    let arrowIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "arrow.png")?.withRenderingMode(.alwaysOriginal))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let plusIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "plus.png")?.withRenderingMode(.alwaysOriginal))
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    override func layoutSubviews() {
       setupViews()
        
    }
    
    func setupViews() {
        self.clipsToBounds = true
        backgroundColor = UIColor.ACTIONBUTTONBACKGROUNDCOLOR()
        addSubview(arrowIcon)
        arrowIcon.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 21.5, paddingLeft: 19.15, paddingBottom: 0, paddingRight: 0, width: 17.18, height: 16.58)
        
        addSubview(plusIcon)
        plusIcon.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 16.5, width: 9, height: 9)
    }
    
    func slideOutArrow() {
        UIView.animate(withDuration: 0.5, animations: {
            self.arrowIcon.anchor(top: self.topAnchor, left: nil, bottom: nil, right: self.rightAnchor, paddingTop: 21.5, paddingLeft: 0, paddingBottom: 0, paddingRight: -60, width: 17.18, height: 16.58)
            self.layoutIfNeeded()

        }) { (true) in
            print("arrow slide out complete")
            // rotate plus Icon into place
        }
        
    }
    
    
}
