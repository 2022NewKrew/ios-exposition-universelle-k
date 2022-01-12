import UIKit

class MainView: UIStackView {
    private var expositionTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.numberOfLines = 0
        return label
    }()
    
    private var expositionImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private var expositionInfomation: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        return label
    }()
    
    private var expositionDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
    private var koreanEntries: UIButton = {
        let button = UIButton()
        button.setTitle("한국의 출품작 보러가기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(MainViewController.toKoreanEntries), for: .touchUpInside)
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
        guard let expositionData = Decoder.decodeEntry(type: ExpositionData.self, from: "exposition_universelle_1900")
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
        self.addArrangedSubview(koreanEntries)
        self.alignment = .center
        self.axis = .vertical
        self.distribution = .fill
        self.spacing = 10
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
