import UIKit

class MainView: UIStackView {
    private let expositionTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
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
    
    private let expositionVisitor: UILabel = {
        let label: UILabel = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
    private let expositionLocation: UILabel = {
        let label: UILabel = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
    private let expositionDuration: UILabel = {
        let label: UILabel = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
    private let expositionDescription: UILabel = {
        let label = UILabel()
        label.adjustsFontForContentSizeCategory = true
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
    private let koreanButtonView: UIStackView = {
        let stackView = UIStackView()
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
        emphasizeLabels()
        
        koreanButtonView.addArrangedSubview(makeFlag())
        koreanButtonView.addArrangedSubview(koreanEntries)
        koreanButtonView.addArrangedSubview(makeFlag())
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func decodeJsonData() {
        guard let expositionData = Decoder.decodeJSONData(type: ExpositionData.self, from: "exposition_universelle_1900")
        else { return }
        expositionTitle.text = expositionData.title
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let formattedVisitor = numberFormatter.string(from: NSNumber(value: expositionData.visitorsCount)) else { return }
        
        expositionVisitor.text = "방문객: \(formattedVisitor)명"
        expositionVisitor.font = UIFont.preferredFont(forTextStyle: .body)
        expositionLocation.text = "개최지: \(expositionData.location)"
        expositionDuration.text = "개최기간: \(expositionData.duration)"

        expositionDescription.text = expositionData.description
    }
    
    private func emphasizeLabels() {
        expositionVisitor.changeFont(targetString: "방문객:", font: UIFont.preferredFont(forTextStyle: .title3))
        expositionLocation.changeFont(targetString: "개최지:", font: UIFont.preferredFont(forTextStyle: .title3))
        expositionDuration.changeFont(targetString: "개최기간:", font: UIFont.preferredFont(forTextStyle: .title3))
    }
    
    private func settingStackView() {
        self.addArrangedSubview(expositionTitle)
        self.addArrangedSubview(expositionImageView)
        self.addArrangedSubview(expositionVisitor)
        self.addArrangedSubview(expositionLocation)
        self.addArrangedSubview(expositionDuration)
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

extension UILabel {
    func changeFont(targetString: String, font: UIFont) {
        let fullText = self.text ?? ""
        let splitted = fullText.split(separator: ":").map{ String.init($0) }
        let range = (fullText as NSString).range(of: targetString)
        let range2 = (fullText as NSString).range(of: splitted[1])
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        attributedString.addAttribute(.font, value: UIFont.preferredFont(forTextStyle: .body), range: range2)
        self.attributedText = attributedString
    }
}
