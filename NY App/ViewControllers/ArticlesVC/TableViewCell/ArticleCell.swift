//
//  ArticleCell.swift
//  NY Techno App
//
//  Created by Syed Bilal on 03/08/2024.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var storyImgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    static var identifier = "ArticleCellId"
    
    var data: String! {
        didSet {
            
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
