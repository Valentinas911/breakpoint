//
//  Message.swift
//  breakpoint
//
//  Created by Valentinas Mirosnicenko on 5/23/18.
//  Copyright © 2018 Valentinas Mirosnicenko. All rights reserved.
//

import Foundation

class Message {
    
    public private(set) var content: String!
    public private(set) var senderId: String!
    
    init(content:String, senderId: String) {
        self.content = content
        self.senderId = senderId
    }
    
    
    
}
