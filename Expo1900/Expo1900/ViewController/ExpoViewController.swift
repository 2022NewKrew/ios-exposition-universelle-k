//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var visitorCountLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    private lazy var expo: InternationalExposition = {
        do {
            return try JsonParser.shared.fetchData(from: .expo1900)
        } catch {
            print(error.localizedDescription)
            let errorExpo = InternationalExposition(title: "에러가 발생했습니다",
                                                    visitors: 0,
                                                    location: "Error",
                                                    duration: "Error",description: error.localizedDescription)
            return errorExpo
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLabelText()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func configureLabelText() {
        titleLabel.text = expo.title
        visitorCountLabel.text = "\(expo.visitors.withCommas()) 명"
        locationLabel.text = expo.location
        durationLabel.text = expo.duration
        descriptionTextView.text = expo.description
    }
}

