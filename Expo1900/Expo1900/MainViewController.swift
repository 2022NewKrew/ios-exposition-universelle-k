//
//  MainViewController.swift
//  Expo1900
//
//  Created by kakao on 2022/01/11.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var expositionTitle: UILabel!
    @IBOutlet weak var expositionImageView: UIImageView!
    @IBOutlet weak var expositionInfomation: UILabel!
    @IBOutlet weak var expositionDescription: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
//    @IBOutlet weak var goNextPage: UIButton!
//    
//    @IBAction func TouchUpGoNextPage(_ sender: Any) {
//        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "ViewController") else { return }
//        viewController.modalPresentationStyle = .fullScreen
//        present(viewController, animated: true, completion: nil)
//    }
    
    var expositionData: ExpositionData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        expositionData = Decoder.decodeEntry(type: ExpositionData.self, from: "exposition_universelle_1900") ?? expositionData

        guard let expositionData = expositionData else { return }
        
        expositionTitle.text = expositionData.title
        expositionImageView.image = UIImage(named: "poster")
        expositionInfomation.text = """
        방문객: \(expositionData.visitorsCount)
        개최지: \(expositionData.location)
        개최기간: \(expositionData.duration)
        """
        expositionDescription.text = "\(expositionData.description)"
        
        //scrollView.updateContentSize()
    }
}


//extension UIScrollView {
//    func updateContentSize() {
//        let unionCalculatedTotalRect = recursiveUnionInDepthFor(view: self)
//
//        // 계산된 크기로 컨텐츠 사이즈 설정
//        self.contentSize = CGSize(width: self.frame.width, height: unionCalculatedTotalRect.height+50)
//    }
//
//    private func recursiveUnionInDepthFor(view: UIView) -> CGRect {
//        var totalRect: CGRect = .zero
//
//        // 모든 자식 View의 컨트롤의 크기를 재귀적으로 호출하며 최종 영역의 크기를 설정
//        for subView in view.subviews {
//            totalRect = totalRect.union(recursiveUnionInDepthFor(view: subView))
//        }
//
//        // 최종 계산 영역의 크기를 반환
//        return totalRect.union(view.frame)
//    }
//}


