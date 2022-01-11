//
//  MainViewController.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let mainView = MainView()
        self.view.addSubview(mainView)
        mainView.setConstraint(view: mainView.expositionTitle, layout: self.view.layoutMarginsGuide, left: 20, right: 20, top: 30, bottom: nil)
        mainView.expositionImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainView.setConstraint(view: mainView.expositionImageView, layout: mainView.expositionTitle.layoutMarginsGuide, left: 30, right: 30, top: 20, bottom: nil)
        mainView.setConstraint(view: mainView.expositionInfomation, layout: mainView.expositionImageView.layoutMarginsGuide, left: 16, right: 16, top: 20, bottom: nil)
        mainView.setConstraint(view: mainView.expositionDescription, layout: mainView.expositionInfomation.layoutMarginsGuide, left: 16, right: 16, top: 20, bottom: nil)
    }
}
