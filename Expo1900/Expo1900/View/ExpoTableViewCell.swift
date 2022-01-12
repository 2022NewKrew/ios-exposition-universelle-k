//
//  ExpoTableViewCell.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class ExpoTableViewCell: UITableViewCell {
    private let titleLabel: UILabel = UILabel.make(with: .title1, textAlignment: .left)
    private let shortDescLabel: UILabel = UILabel.make(with: .body, textAlignment: .left)
    
    private lazy var labelStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [titleLabel, shortDescLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let expoImageView: UIImageView = UIImageView.make()
    
    private lazy var contentStackView: UIStackView = {
        let stackView: UIStackView = UIStackView(arrangedSubviews: [expoImageView, labelStackView])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
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

