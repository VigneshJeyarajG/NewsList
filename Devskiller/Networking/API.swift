//
//  API.swift
//  Devskiller
//
//  Created by VAMOSYS DRS on 06/08/22.
//  Copyright © 2022 Mindera. All rights reserved.
//
import UIKit


struct API {
    static let liveUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=af61475dea274ccea526bad2a121faac"
    struct NewsManager {
        static let trending = "\(API.liveUrl)"
        static let likes = "https://cn-news-info-api.herokuapp.com/likes/"
        static let comments = "https://cn-news-info-api.herokuapp.com/comments/"
    }
}
