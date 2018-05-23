//
//  FeedCell.swift
//  breakpoint
//
//  Created by Valentinas Mirosnicenko on 5/23/18.
//  Copyright © 2018 Valentinas Mirosnicenko. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    
    func configureCell(profileImage: UIImage, email: String, post: String) {
        self.userImage.image = profileImage
        self.emailLabel.text = email
        self.postLabel.text = post
    }

}
