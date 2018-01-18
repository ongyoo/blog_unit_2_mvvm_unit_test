//
//  NewsTableViewCell.swift
//  unit_2_mvvm_unit_test
//
//  Created by Komsit Chusangthong on 1/15/18.
//  Copyright © 2018 Komsit Chusangthong. All rights reserved.
//

import UIKit
import SDWebImage

class NewsTableViewCell: UITableViewCell {
    static let Identifier = "NewsTableViewCell"
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDetailLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func render(data: ArticleModel?) {
        guard let dataModel = data,
        let imageUrl = dataModel.urlToImage else  { return }
        
        newsTitleLabel.text = dataModel.title ?? ""
        newsDetailLabel.text = dataModel.des ?? ""
        
        // Image URL
        guard let url = URL(string: imageUrl) else { return }
        newsImageView.sd_setImage(with: url, completed: nil)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
