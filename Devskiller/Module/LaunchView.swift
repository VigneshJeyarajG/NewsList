//
//  LoginView.swift
//  Devskiller
//
//  Created by VAMOSYS DRS on 06/08/22.
//  Copyright © 2022 Mindera. All rights reserved.
//

import UIKit

extension LaunchViewController : UITableViewDelegate{}

extension LaunchViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NewsArray.info.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(for: indexPath) as NewsListTableViewCell
        cell.setCell(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NewsArray.detail = NewsArray.info[indexPath.row]
        navigationPushRedirect(storyBoardName: "Main", storyBoardId: "NewsDetail")
    }
}
