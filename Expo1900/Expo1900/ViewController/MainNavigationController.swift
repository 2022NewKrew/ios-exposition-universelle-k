//
//  MainNavigationController.swift
//  Expo1900
//
//  Created by kakao on 2022/01/17.
//

import UIKit

class MainNavigationController: UINavigationController {

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return visibleViewController?.supportedInterfaceOrientations ?? .all
    }
    
}
