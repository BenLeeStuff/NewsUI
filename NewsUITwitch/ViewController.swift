//
//  ViewController.swift
//  NewsUITwitch
//
//  Created by Ben Lee on 8/30/19.
//  Copyright © 2019 Ben Lee. All rights reserved.
//

import UIKit
import SimpleAnimation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    lazy var viewHeight =  view.frame.height
    lazy var newsViewInitialHeight = 80
    lazy var newsViewExpandedHeight = view.frame.height * 0.625
    
    @IBOutlet weak var newsView: UIView!
    @IBOutlet weak var newsButton: UIButton!
    
    @IBOutlet weak var newsCollectionView: UICollectionView!
    
    @IBOutlet weak var newsViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var newsViewTopConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
        Date().getTime()
    }
    
    func setupViews() {
        newsButton.setTitleColor(UIColor.MAINTEXTCOLOR(), for: .normal)
        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self
        newsView.layer.cornerRadius = 8
        newsView.clipsToBounds = true
    }

    @IBAction func newsButtonPressed(_ sender: Any) {
        UIView.animate(withDuration: 0.6, animations: {
            self.newsViewHeightConstraint.constant = self.newsViewExpandedHeight
            
            self.newsViewTopConstraint.constant = self.viewHeight * 0.15217
            self.view.layoutIfNeeded()
            self.shimmerNewsButton()
        }) { (true) in
            print("stage1 complete")
        }
    }
    
    func shimmerNewsButton() {
        UIView.animate(withDuration: 0.4, animations: {
            self.newsButton.alpha = 0.15

        }) { (true) in
            UIView.animate(withDuration: 0.2, animations: {
                self.newsButton.alpha = 1

            }, completion: { (true) in
                print("News button shimmer complete")
            })
        }
    }
    
    func animateCellsToPopUp() {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.item {
        case 0:
            let chatCell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "chatCellId", for: indexPath) as! ChatCell
            chatCell.isHidden = true
            return chatCell
        case 1:
            let interactiveNewsCell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "interactiveNewsCellId", for: indexPath) as! InteractiveNewsCell
            interactiveNewsCell.isHidden = true
            return interactiveNewsCell
        case 2:
            let systemMessagesCell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "systemMessagesCellId", for: indexPath) as! SystemMessagesCell
            systemMessagesCell.isHidden = true
            return systemMessagesCell
        case 3:
            let userCell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "userCellId", for: indexPath) as! UserCell
            userCell.isHidden = true
            return userCell
        case 4:
            
            let noticeIssedCell = newsCollectionView.dequeueReusableCell(withReuseIdentifier: "noticeIssedCellId", for: indexPath) as! NoticeIssuedCell
            noticeIssedCell.isHidden = true
            return noticeIssedCell
            
        default:
            return UICollectionViewCell()
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item != 4 {
             return CGSize(width: self.newsCollectionView.frame.width - 30, height: 70)
        } else {
           return CGSize(width: self.newsCollectionView.frame.width - 60, height: 46)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}

