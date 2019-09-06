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
    let transparentCircleLayer = CAShapeLayer()
    let solidCircleLayer = CAShapeLayer()

    let newsView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 8
        v.clipsToBounds = true
        v.layer.shadowColor = UIColor.SHADOWCOLOR().cgColor
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
    
    let circleOverlay: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }()
    
    let actionButton: ActionButton = {
        let b = ActionButton(type: .system)
        b.layer.cornerRadius = 28
        b.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
        return b
    }()
    
    let popOutButtonContainer: UIView = {
        let v = UIView()
        v.backgroundColor = .clear
        return v
    }()
    
    let babyButton: UIButton = {
        let b = UIButton(type: .system)
        b.setImage(UIImage(named: "baby.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return b
    }()
    
    let profileButton: UIButton = {
        let b = UIButton(type: .system)
        b.setImage(UIImage(named: "profile.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return b
    }()
    
    let notifyColleaguesView: ButtonDescriptionView = {
        let v = ButtonDescriptionView()
        v.title = "Notify Colleagues"
        return v
    }()
    
    let informStudentsView: ButtonDescriptionView = {
        let v = ButtonDescriptionView()
        v.title = "Inform Students"
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
        
        newsView.addSubview(circleOverlay)
        circleOverlay.anchor(top: nil, left: nil, bottom: newsView.bottomAnchor, right: newsView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 43, paddingRight: 30, width: 58 / 2, height: 58 / 2)
        circleOverlay.layer.cornerRadius = circleOverlay.frame.height / 2
        
        newsView.addSubview(actionButton)
        actionButton.anchor(top: nil, left: nil, bottom: newsView.bottomAnchor, right: newsView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 43, paddingRight: 30, width: 58, height: 58)
        
        actionButton.alpha = 0
        circleOverlay.alpha = 0
        createCircleOverlayPath()
    }
    
    @objc func newsButtonPressed() {
        // expand the newsView
        self.newsButton.isHighlighted = false
        UIView.animate(withDuration: 0.6, animations: {
            self.newsButton.anchor(top: self.newsView.topAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 55)
            self.newsView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: self.newsViewTopAndBottomPadding, paddingLeft: 38, paddingBottom: self.newsViewTopAndBottomPadding, paddingRight: 38, width: 0, height: self.newsViewExpandedHeight - self.newsViewInitialHeight)
            self.shadowView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: self.newsViewTopAndBottomPadding + 4, paddingLeft: 38 + 4, paddingBottom: self.newsViewTopAndBottomPadding + 4, paddingRight: 38 + 4, width: 0, height: self.newsViewExpandedHeight - self.newsViewInitialHeight)
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
            self.animateCellsToPopUp()
            self.popInActionButton()
            self.addPopoutButtonContainer()
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
    
    func popInActionButton() {
        
        actionButton.popIn(fromScale: 0, duration: 0.6, delay: 0.4) { (true) in
            print("actionButton Popped In")
        }
    }
    
    func animateCellsToPopUp() {
        UIView.animate(withDuration: 0.6) {
            self.chatView.overlay.alpha = 0
            self.chatView.topAnchor.constraint(equalTo: self.newsButton.bottomAnchor, constant: 0).isActive = true
            UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                self.chatView.underlyingView.backgroundColor = .white

            }, completion: nil)
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.6, delay: 0.2, options: [], animations: {
                self.interactiveNewsView.overlay.alpha =  0
                self.interactiveNewsView.topAnchor.constraint(equalTo: self.newsButton.bottomAnchor, constant: self.newsViewInitialHeight).isActive = true
                
                UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                    self.interactiveNewsView.underlyingView.backgroundColor = .white

                }, completion: nil)

                self.view.layoutIfNeeded()
                UIView.animate(withDuration: 0.6, delay: 0.2, options: [], animations: {
                    self.systemMessagesView.overlay.alpha =  0
                    self.systemMessagesView.topAnchor.constraint(equalTo: self.newsButton.bottomAnchor, constant: self.newsViewInitialHeight * 2).isActive = true
                    
                    UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                        self.systemMessagesView.underlyingView.backgroundColor = .white
                    }, completion: nil)
                    
                    self.view.layoutIfNeeded()
                    UIView.animate(withDuration: 0.6, delay: 0.2, options: [], animations: {
                        self.userView.overlay.alpha =  0
                        self.userView.topAnchor.constraint(equalTo: self.newsButton.bottomAnchor, constant: self.newsViewInitialHeight * 3).isActive = true
                        
                        UIView.animate(withDuration: 0.5, delay: 0.2, options: [], animations: {
                            self.userView.underlyingView.backgroundColor = .white
                        }, completion: nil)
                        
                        self.view.layoutIfNeeded()
                        UIView.animate(withDuration: 0.6, delay: 0.2, options: [], animations: {
                            self.noticeIssuedView.overlay.alpha =  0
                            self.noticeIssuedView.topAnchor.constraint(equalTo: self.newsButton.bottomAnchor, constant: self.newsViewInitialHeight * 4 + 10).isActive = true
                            
                            
                            self.view.layoutIfNeeded()
                        }, completion: nil)
                    }, completion: nil)
                }, completion: nil)
            }, completion: nil)
        }
    }
    
    @objc func actionButtonPressed() {
        self.actionButton.slideOutArrow()
        animateTransparentCircle()
        popInTheButtonsThatAppearAfterTheActionButtonIsPressed()
        animateSolidCircle()
    }

    func createCircleOverlayPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: actionButton.frame.origin.x - (actionButton.frame.width / 2), y: actionButton.frame.origin.y + (actionButton.frame.width / 2)), radius: 28, startAngle: 0, endAngle: 2 * .pi, clockwise: true)
        transparentCircleLayer.path = circularPath.cgPath
        transparentCircleLayer.lineWidth = 2.0
        transparentCircleLayer.fillColor = UIColor.white.cgColor
        transparentCircleLayer.opacity = 0.5
        transparentCircleLayer.lineCap =  CAShapeLayerLineCap.round
        transparentCircleLayer.position =  CGPoint(x: actionButton.frame.size.width / 2, y: actionButton.frame.size.width / 2)
        
        solidCircleLayer.path = circularPath.cgPath
        solidCircleLayer.lineWidth = 2.0
        solidCircleLayer.fillColor = UIColor.white.cgColor
        solidCircleLayer.opacity = 0.96
        solidCircleLayer.lineCap =  CAShapeLayerLineCap.round
        solidCircleLayer.position =  CGPoint(x: actionButton.frame.size.width / 2, y: actionButton.frame.size.width / 2)
        
        circleOverlay.layer.addSublayer(transparentCircleLayer)
        circleOverlay.layer.addSublayer(solidCircleLayer)
    }
    
    func animateTransparentCircle() {
        circleOverlay.alpha = 1
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.duration = 0.5
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 18
        scaleAnimation.isRemovedOnCompletion = false
        scaleAnimation.fillMode = CAMediaTimingFillMode.forwards
        self.newsView.sendSubviewToBack(self.chatView)
        transparentCircleLayer.add(scaleAnimation, forKey: "scale")
    }
    
    func animateSolidCircle() {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.beginTime = CACurrentMediaTime() + 0.2
        scaleAnimation.duration = 0.5
        scaleAnimation.fromValue = 0
        scaleAnimation.toValue = 18
        scaleAnimation.isRemovedOnCompletion = false
        scaleAnimation.fillMode = CAMediaTimingFillMode.forwards
        solidCircleLayer.add(scaleAnimation, forKey: "scale")
    }
    
    func hideAllNewsViewContentViews() {
        chatView.alpha = 0
        interactiveNewsView.alpha = 0
        systemMessagesView.alpha = 0
        userView.alpha = 0
        noticeIssuedView.alpha = 0
    }
    
    func addPopoutButtonContainer() {
        newsView.addSubview(popOutButtonContainer)
        popOutButtonContainer.anchor(top: nil, left: newsView.leftAnchor, bottom: actionButton.topAnchor, right: newsView.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 20, paddingRight: 32, width: 0, height: newsView.frame.height * 0.25)
        
        popOutButtonContainer.addSubview(babyButton)
        babyButton.anchor(top: nil, left: nil, bottom: popOutButtonContainer.bottomAnchor, right: popOutButtonContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        popOutButtonContainer.addSubview(profileButton)
        profileButton.anchor(top: popOutButtonContainer.topAnchor, left: nil, bottom: nil, right: popOutButtonContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
        
        popOutButtonContainer.addSubview(informStudentsView)
        informStudentsView.anchor(top: nil, left:  nil, bottom: popOutButtonContainer.bottomAnchor, right: babyButton.leftAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight: 10, width: 0, height: 32)
        
        popOutButtonContainer.addSubview(notifyColleaguesView)
        notifyColleaguesView.anchor(top: popOutButtonContainer.topAnchor, left: nil, bottom: nil, right: profileButton.leftAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 0, height: 32)
        
        informStudentsView.isHidden = true
        notifyColleaguesView.isHidden = true
        babyButton.isHidden = true
        profileButton.isHidden = true
    }
    
    func popInTheButtonsThatAppearAfterTheActionButtonIsPressed() {
        babyButton.isHidden = false
        babyButton.popIn(fromScale: 0, duration: 0.5, delay: 0) { (true) in
            print("babyButton popIn animation complete")
            self.profileButton.isHidden = false
            self.informStudentsView.isHidden = false
            self.informStudentsView.popIn(fromScale: 0, duration: 0.5, delay: 0.0, completion: nil)
            
            
            //self.profileButton.popIn(fromScale: 0, duration: 0.5, delay: 00, completion: nil)
        }
        
        profileButton.popIn(fromScale: 0, duration: 0.5, delay: 0.2, completion: nil)
        notifyColleaguesView.popIn(fromScale: 0, duration: 0.5, delay: 0.2, completion: nil)
    }
}
