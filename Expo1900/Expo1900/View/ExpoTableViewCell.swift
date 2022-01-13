//
//  ExpoTableViewCell.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class ExpoTableViewCell: UITableViewCell {
    private let titleLabel: UILabel = UILabel(with: .title1, textAlignment: .left)
    private let shortDescLabel: UILabel = UILabel(with: .body, textAlignment: .left)
    
    private lazy var labelStackView: UIStackView = UIStackView(views: [titleLabel,
                                                                       shortDescLabel],
                                                               axis: .vertical,
                                                               alignment: .leading,
                                                               spacing: 5)
    
    private let expoImageView: UIImageView = UIImageView(contentMode: .scaleAspectFit)
    
    private lazy var contentStackView: UIStackView = UIStackView(views: [expoImageView,
                                                                         labelStackView],
                                                                 spacing: 10)
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        accessoryType = .disclosureIndicator
        setupContentStackView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Setup
    private func setupContentStackView() {
        contentView.addSubview(contentStackView)
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            contentStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            contentStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            contentStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            expoImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2),
            expoImageView.heightAnchor.constraint(equalTo: expoImageView.widthAnchor)
        ])
    }

    func updateView(by model: ExpoItem) {
        shortDescLabel.text = model.shortDesc
        titleLabel.text = model.name
        expoImageView.image = model.image
    }
}

