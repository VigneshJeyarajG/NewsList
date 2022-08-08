//
//  WikipediaViewController.swift
//  Devskiller
//
//  Created by VAMOSYS DRS on 06/08/22.
//  Copyright © 2022 Mindera. All rights reserved.

import UIKit
import Kingfisher


class NewsDetailViewController: UIViewController {
    
    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var newsImage: UIImageView!
    @IBOutlet var newsDescription: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var likeCount: UILabel!
    @IBOutlet var commentCount: UILabel!
    @IBOutlet var authorName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        replace()
        showData()
        getLikes()
    }
    
    func replace() {
        NewsArray.detail.url = NewsArray.detail.url.replacingOccurrences(of: "https://", with: "www.")
        NewsArray.detail.url = NewsArray.detail.url.replacingOccurrences(of: "/", with: "-")
    }
    
    //MARK: - getLikes API
    func getLikes() {
        LoadingUtils.shared.showActivityIndicator(view)
        APIClient.shared.getLikes(urlString: NewsArray.detail.url) { (Success, error) in
            if Success {
                self.getComments()
            } else if let error = error {
                self.alert(title: "Message", message: error.localizedDescription, cancel: "ok")
            }
        }
    }
    
    //MARK: - getComments API
    func getComments() {
        APIClient.shared.getComments(urlString: NewsArray.detail.url) { (Success, error) in
            LoadingUtils.shared.hideActivityIndicator(self.view)
            if Success {
                self.showCount()
            } else if let error = error {
                self.alert(title: "Message", message: error.localizedDescription, cancel: "ok")
            }
        }
    }
    
    func showData() {
        newsTitle.text = NewsArray.detail.title
        newsDescription.text = NewsArray.detail.content
        newsImage.kf.setImage(with:  URL(string: NewsArray.detail.urlToImage)!, placeholder: UIImage(named: "placeHolderImage"))
        timeLabel.text = getDate(dateString:NewsArray.detail.publishedAt)?.timeAgoDisplay()
        authorName.text = "by " + NewsArray.detail.author
    }
    
    func showCount() {
        likeCount.text = String(NewsArray.likesCount) + " likes"
        commentCount.text = String(NewsArray.commentsCount) + " comments"
    }

    @IBAction func backTapped(_ sender: UIButton) {
       navigationController?.popViewController(animated: true)
    }
}
