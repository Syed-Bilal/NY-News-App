//
//  ArticleDetailVC.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import UIKit

class ArticleDetailVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var abstractLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var linkLbl: UILabel!
    
    var data: ArticleData? = nil
    
    
    override func viewDidLoad() {
        
        // Add tap gesture recognizer to the label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didLinkTapped))
        linkLbl.addGestureRecognizer(tapGesture)
        
        setViewData()
    }
    
    // MARK: - didLinkTapped()
    @objc func didLinkTapped() {
        if let urlString = data?.url, let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
    
    // MARK: - setViewData()
    func setViewData() {
        titleLbl.text = data?.title ?? "Untitled Article"
        abstractLbl.text = data?.abstract ?? ""
        authorLbl.text = data?.byline ?? ""
        linkLbl.text = data?.url ?? ""
        
        if let date = data?.updated?.getDateFromString(dateFormate: "yyyy-MM-dd HH:mm:ss")?.toLocalTime() {
            dateLbl.text = date.getFormatedStringFromDate(formate: "EEEE, dd MMM, yyyy")
        }
        
        if let media = data?.media?.first {
            let type = ArticleMediaTypeEnum.fromString(rawValue: media.type ?? "")
            if type == .image {
                if let thumbnailUrl = media.mediaMetaData?.last?.url, let url = URL(string: thumbnailUrl) {
                    imgView.sd_setImage(with: url, placeholderImage: UIImage(named: "default-Img-ic"))
                } else {
                    imgView.image = UIImage(named: "default-Img-ic")
                }
            } else {
                imgView.image = UIImage(named: "default-Img-ic")
            }
        } else {
            imgView.image = UIImage(named: "default-Img-ic")
        }
    }
}
