//
//  NewsListTableViewCell.swift
//  Devskiller
//
//  Created by VAMOSYS DRS on 06/08/22.
//  Copyright © 2022 Mindera. All rights reserved.

import UIKit
import Kingfisher

class NewsListTableViewCell: UITableViewCell, NibLoadableView {
    
    @IBOutlet var authorNameLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var newsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
        self.isOpaque = false
    }

    func setCell(index:Int) {
        let info = NewsArray.info[index]
        authorNameLabel.text = info.author
        titleLabel.text = info.title
        timeLabel.text = getDate(dateString: info.publishedAt)?.timeAgoDisplay()
        newsImageView.kf.setImage(with: URL(string: info.urlToImage)!, placeholder: UIImage(named: "placeHolderImage"))
    }
}
