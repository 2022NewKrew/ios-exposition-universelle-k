import UIKit

class MainView: UIView {
    var expositionTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.numberOfLines = 0
        return label
    }()
    
    var expositionImageView: UIImageView = {
        let imageView: UIImageView = UIImageView()
        imageView.image = UIImage(named: "poster")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var expositionInfomation: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.numberOfLines = 0
        return label
    }()
    
    var expositionDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        return label
    }()
    
//    private var scrollView: UIScrollView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(expositionTitle)
        addSubview(expositionImageView)
        addSubview(expositionInfomation)
        addSubview(expositionDescription)
        let expositionData = Decoder.decodeEntry(type: ExpositionData.self, from: "exposition_universelle_1900")
        guard let expositionData = expositionData else { return }
        expositionTitle.text = expositionData.title
        expositionInfomation.text = """
        방문객: \(expositionData.visitorsCount)
        개최지: \(expositionData.location)
        개최기간: \(expositionData.duration)
        """
        expositionDescription.text = "\(expositionData.description)"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


