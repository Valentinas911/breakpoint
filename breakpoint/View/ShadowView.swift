//
//  ShadowView.swift
//  breakpoint
//
//  Created by Valentinas Mirosnicenko on 5/15/18.
//  Copyright © 2018 Valentinas Mirosnicenko. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        layer.shadowOpacity = 0.75
        layer.shadowRadius = 5
        layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }
    
}
