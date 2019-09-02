//
//  NewsViewController.swift
//  NewsUITwitch
//
//  Created by Ben Lee on 8/30/19.
//  Copyright © 2019 Ben Lee. All rights reserved.
//

import UIKit
import SimpleAnimation

class NewsViewController: UIViewController {
    
    lazy var viewHeight =  view.frame.height
    lazy var newsViewInitialHeight = CGFloat(80)
    lazy var newsViewExpandedHeight = view.frame.height * 0.625
    lazy var newsViewTopAndBottomPadding = view.frame.height * 0.1875
    lazy var innerViewAnimationStartTopPadding = newsViewExpandedHeight * 0.45217
    
    let newsView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 8
        v.clipsToBounds = true
        v.layer.shadowColor = UIColor.rgb(red: 180, green: 180, blue: 202).cgColor
        v.layer.shadowRadius = 3
        v.layer.shadowOpacity = 1
        return v
    }()
    
    let shadowView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.shadowColor = UIColor.rgb(red: 180, green: 180, blue: 202).cgColor
        v.layer.shadowRadius = 25
        v.layer.shadowOpacity = 0.3
        return v
    }()
    
    let newsButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("News", for: .normal)
        b.setTitleColor(UIColor.MAINTEXTCOLOR(), for: .normal)
        b.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        b.addTarget(self, action: #selector(newsButtonPressed), for: .touchUpInside)
        return b
    }()
    
    let chatView: ChatView = {
        let cv = ChatView()
        return cv
    }()
    
    let interactiveNewsView: InteractiveNewsView = {
        let v = InteractiveNewsView()
        return v
    }()
    
    let systemMessagesView: SystemMessagesView = {
        let v = SystemMessagesView()
        return v
    }()
    
    let userView: UserView = {
        let v = UserView()
        return v
    }()
    
    let noticeIssuedView: NoticeIssuedView = {
        let v = NoticeIssuedView()
        return v
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupViews()
    }
    
    func setupViews() {
        
        view.addSubview(shadowView)
        shadowView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 42, paddingBottom: 0, paddingRight: 42, width: 0, height: newsViewInitialHeight - 8)
        shadowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        view.addSubview(newsView)
        newsView.anchor(top: nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 38, paddingBottom: 0, paddingRight: 38, width: 0, height: newsViewInitialHeight)
        newsView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        newsView.addSubview(newsButton)
        newsButton.anchor(top: newsView.topAnchor, left: newsView.leftAnchor, bottom: nil, right: newsView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: newsViewInitialHeight)
//
        newsView.addSubview(chatView)
        chatView.anchor(top: newsButton.bottomAnchor, left: newsView.leftAnchor, bottom: nil, right: newsView.rightAnchor, paddingTop: innerViewAnimationStartTopPadding, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: newsViewInitialHeight)
//
        newsView.addSubview(interactiveNewsView)
        interactiveNewsView.anchor(top: newsButton.bottomAnchor, left: newsView.leftAnchor, bottom: nil, right: newsView.rightAnchor, paddingTop: innerViewAnimationStartTopPadding, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: newsViewInitialHeight)

        newsView.addSubview(systemMessagesView)
        systemMessagesView.anchor(top: newsButton.bottomAnchor, left: newsView.leftAnchor, bottom: nil, right: newsView.rightAnchor, paddingTop: innerViewAnimationStartTopPadding, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: newsViewInitialHeight)

        newsView.addSubview(userView)
        userView.anchor(top: newsButton.bottomAnchor, left: newsView.leftAnchor, bottom: nil, right: newsView.rightAnchor, paddingTop: newsViewInitialHeight * 3, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: newsViewInitialHeight)

        newsView.addSubview(noticeIssuedView)
        noticeIssuedView.anchor(top: newsButton.bottomAnchor, left: newsView.leftAnchor, bottom: nil, right: newsView.rightAnchor, paddingTop: (newsViewInitialHeight * 4) + 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: newsViewInitialHeight)
    }
    
    @objc func newsButtonPressed() {
        // expand the newsView
        self.newsButton.isHighlighted = false
        UIView.animate(withDuration: 0.6, animations: {
            self.newsButton.anchor(top: self.newsView.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 55)
            self.newsView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: self.newsViewTopAndBottomPadding, paddingLeft: 38, paddingBottom: self.newsViewTopAndBottomPadding, paddingRight: 38, width: 0, height: self.newsViewExpandedHeight - self.newsViewInitialHeight)
            UIView.animate(withDuration: 0.2, delay: 0, options: [], animations: {
                self.newsButton.alpha = 0
            }, completion: { (true) in
                UIView.animate(withDuration: 0.4, animations: {
                    self.newsButton.alpha = 1
                })
            })
            self.view.layoutIfNeeded()
        }) { (true) in
            print("news view expanded maybe idk")
            self.newsView.addSubview(self.chatView)
            self.chatView.alpha = 1
            //self.chatView.anchor(top: self.newsButton.bottomAnchor, left: self.newsView.leftAnchor, bottom: nil, right: self.newsView.rightAnchor, paddingTop: self.innerViewAnimationStartTopPadding, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: self.newsViewInitialHeight)
            self.animateCellsToPopUp()
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
        UIView.animate(withDuration: 0.5) {
            self.chatView.overlay.alpha = 0
            self.chatView.topAnchor.constraint(equalTo: self.newsButton.bottomAnchor, constant: 0).isActive = true
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                self.interactiveNewsView.overlay.alpha =  0
                self.interactiveNewsView.topAnchor.constraint(equalTo: self.newsButton.bottomAnchor, constant: self.newsViewInitialHeight).isActive = true
                self.view.layoutIfNeeded()
                UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                    self.systemMessagesView.overlay.alpha =  0
                    self.systemMessagesView.topAnchor.constraint(equalTo: self.newsButton.bottomAnchor, constant: self.newsViewInitialHeight * 2).isActive = true
                    self.view.layoutIfNeeded()
                    UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                        self.userView.overlay.alpha =  0
                        self.userView.topAnchor.constraint(equalTo: self.newsButton.bottomAnchor, constant: self.newsViewInitialHeight * 3).isActive = true
                        self.view.layoutIfNeeded()
                        UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                            self.noticeIssuedView.overlay.alpha =  0
                            self.noticeIssuedView.topAnchor.constraint(equalTo: self.newsButton.bottomAnchor, constant: self.newsViewInitialHeight * 4 + 10).isActive = true
                            self.view.layoutIfNeeded()
                        }, completion: nil)
                    }, completion: nil)
                }, completion: nil)
            }, completion: nil)
        }

    }
    
    func hideAllNewsViewContentViews() {
        chatView.alpha = 0
        interactiveNewsView.alpha = 0
        systemMessagesView.alpha = 0
        userView.alpha = 0
        noticeIssuedView.alpha = 0
//        chatView.isHidden = true
//        interactiveNewsView.isHidden = true
//        systemMessagesView.isHidden = true
//        userView.isHidden = true
//        noticeIssuedView.isHidden = true
    }

}
