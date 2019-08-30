//
//  NoticeIssuedCell.swift
//  NewsUITwitch
//
//  Created by Ben Lee on 8/30/19.
//  Copyright © 2019 Ben Lee. All rights reserved.
//

import UIKit

class NoticeIssuedCell: UICollectionViewCell {
    
    let dashedView: UIImageView = {
        let v = UIImageView(image: UIImage(named: "dashedBox.png"))
        v.contentMode = .scaleAspectFill
        return v
    }()
    
    let descriptionLabel: UILabel = {
        let l = UILabel()
        l.text = "Notice Issued"
        l.font = UIFont.systemFont(ofSize: 12)
        l.textColor = UIColor.DESCRIPTEXTCOLOR()
        l.textAlignment = .center
        return l
    }()
    
    override func layoutSubviews() {
        setupViews()
    }
    
    func setupViews() {
        addSubview(dashedView)
        dashedView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(descriptionLabel)
        
        descriptionLabel.anchor(top: nil, left: leftAnchor, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 14)
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
}
