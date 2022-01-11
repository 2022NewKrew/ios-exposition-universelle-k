//
//  MainViewController.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class MainViewController: UIViewController {
    let mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView()
        self.view.addSubview(scrollView)
        
        
        //self.view.addSubview(mainView)
        
        
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        scrollView.addSubview(mainView)
        setAllConstraint()
        
        //scrollView.contentSize = mainView.bounds.size
        
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        setOuterConstraint(view: mainView, layout: scrollView.contentLayoutGuide, left: 0, right: 0)
        mainView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true

        mainView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
        mainView.heightAnchor.constraint(equalToConstant: 10000).isActive = true
        
    }
    
    override func viewWillLayoutSubviews() {
        print(view.bounds.size)
        print(view.frame.size)
    }
    
    func setAllConstraint() {

        
        mainView.expositionTitle.translatesAutoresizingMaskIntoConstraints = false
        mainView.expositionTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        mainView.expositionTitle.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        mainView.expositionTitle.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        mainView.expositionImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainView.expositionImageView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4).isActive = true
        setInnerConstraint(view: mainView.expositionImageView, layout: mainView.expositionTitle.layoutMarginsGuide,top: 20, bottom: nil)

        setOuterConstraint(view: mainView.expositionInfomation, layout: self.view.safeAreaLayoutGuide, left: 20, right: 20)
        setInnerConstraint(view: mainView.expositionInfomation, layout: mainView.expositionImageView.layoutMarginsGuide,top: 20, bottom: nil)
        
        
        setOuterConstraint(view: mainView.expositionDescription, layout: self.view.safeAreaLayoutGuide, left: 16, right: 16)
        setInnerConstraint(view: mainView.expositionDescription, layout: mainView.expositionInfomation.layoutMarginsGuide,top: 20, bottom: nil)
    }

    func setOuterConstraint(view: UIView, layout: UILayoutGuide, left: CGFloat?, right: CGFloat?) {
        view.translatesAutoresizingMaskIntoConstraints = false
        if let left: CGFloat = left {
            view.leadingAnchor.constraint(equalTo: layout.leadingAnchor, constant: left).isActive = true
        }
        if let right: CGFloat = right {
            view.trailingAnchor.constraint(equalTo: layout.trailingAnchor, constant: -right).isActive = true
        }
    }
    func setInnerConstraint(view: UIView, layout: UILayoutGuide, top: CGFloat?, bottom: CGFloat?) {
        view.translatesAutoresizingMaskIntoConstraints = false
        if let top: CGFloat = top {
            view.topAnchor.constraint(equalTo: layout.bottomAnchor, constant: top).isActive = true
        }
        
        if let bottom: CGFloat = bottom {
            view.bottomAnchor.constraint(equalTo: layout.bottomAnchor, constant: -bottom).isActive = true
        }
    }
    
}
