//
//  ArticleCell.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import UIKit
import SDWebImage

class ArticleCell: UITableViewCell {

    @IBOutlet weak var storyImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    static var identifier = "ArticleCellId"
    
    var data: ArticleData! {
        didSet {
            titleLbl.text = data.title ?? "Untitled Article"
            descriptionLbl.text = data.abstract ?? ""
            authorLbl.text = data.byline ?? ""
            
            if let date = data.published_date {
                dateLbl.text = date
            } else {
                if let updated = data.updated, let date = updated.split(separator: " ").first {
                    dateLbl.text = String(date)
                } else {
                    dateLbl.text = "N/A"
                }
            }
            
            if let media = data.media?.first {
                let type = ArticleMediaTypeEnum.fromString(rawValue: media.type ?? "")
                if type == .image {
                    if let thumbnailUrl = media.mediaMetaData?.first?.url, let url = URL(string: thumbnailUrl) {
                        storyImgView.sd_setImage(with: url, placeholderImage: UIImage(named: "default-Img-ic"))
                    } else {
                        storyImgView.image = UIImage(named: "default-Img-ic")
                    }
                } else {
                    storyImgView.image = UIImage(named: "default-Img-ic")
                }
            } else {
                storyImgView.image = UIImage(named: "default-Img-ic")
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
