import UIKit

class MainView: UIStackView {
    private let expositionTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.numberOfLines = 0
        return label
    }()
    
    private let expositionImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let expositionInfomation: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        return label
    }()
    
    private let expositionDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var koreanButtonView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [makeFlag(), koreanEntries, makeFlag()])
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.spacing = 20
        stackView.alignment = .center
        return stackView
    }()
    
    private let koreanEntries: UIButton = {
        let button = UIButton()
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(MainViewController.moveKoreanEntries), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        settingStackView()
        decodeJsonData()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func decodeJsonData() {
        guard let expositionData = Decoder.decodeJSONData(type: ExpositionData.self, from: "exposition_universelle_1900")
        else { return }
        expositionTitle.text = expositionData.title
        expositionInfomation.text = """
            방문객: \(expositionData.visitorsCount)
            개최지: \(expositionData.location)
            개최기간: \(expositionData.duration)
        """
        expositionDescription.text = expositionData.description
    }
    
    private func settingStackView() {
        self.addArrangedSubview(expositionTitle)
        self.addArrangedSubview(expositionImageView)
        self.addArrangedSubview(expositionInfomation)
        self.addArrangedSubview(expositionDescription)
        self.addArrangedSubview(koreanButtonView)
        self.alignment = .center
        self.axis = .vertical
        self.distribution = .fill
        self.spacing = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func makeFlag() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "flag")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return imageView
    }
}
