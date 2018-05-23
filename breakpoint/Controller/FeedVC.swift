//
//  FeedVC.swift
//  breakpoint
//
//  Created by Valentinas Mirosnicenko on 5/15/18.
//  Copyright © 2018 Valentinas Mirosnicenko. All rights reserved.
//

import UIKit

class FeedVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var messages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DataService.instance.getFeedMessages { (messages) in
            self.messages = messages
            self.tableView.reloadData()
        }
    }
    
}

extension FeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath) as? FeedCell {
            let message = messages[indexPath.row]
            let defaultImage = UIImage(named: "defaultProfileImage")
            cell.configureCell(profileImage: defaultImage!, email: message.senderId, post: message.content)
            return cell
        } else {
            return FeedCell()
        }
    }
    
}

