//
//  DataService.swift
//  breakpoint
//
//  Created by Valentinas Mirosnicenko on 5/15/18.
//  Copyright © 2018 Valentinas Mirosnicenko. All rights reserved.
//

import Foundation
import Firebase

let DB_BASE = Database.database().reference()

class DataService {
    
    static let instance = DataService()
    
    public private(set) var REF_BASE = DB_BASE
    public private(set) var REF_USERS = DB_BASE.child("users")
    public private(set) var REF_GROUPS = DB_BASE.child("groups")
    public private(set) var REF_FEED = DB_BASE.child("feed")
    
    func createDBUser(uid: String, userData: Dictionary<String, Any>) {
        REF_USERS.child(uid).updateChildValues(userData)
    }
    
    func uploadPost(withMessage message: String, forUID uid: String, withGroupKey groupKey: String?, completion: @escaping (_ success: Bool) -> ()) {
        if groupKey != nil {
            // Send to groups refference
        } else {
//            REF_FEED.childByAutoId().updateChildValues(["content": message,"senderId": uid])
            
            REF_FEED.childByAutoId().updateChildValues(["content": message,"senderId": uid]) { (error, ack) in
                if error != nil {
                    debugPrint(String(describing:error?.localizedDescription))
                    completion(false)
                } else {
                    completion(true)
                }
            }
        }
    }
    
    func getFeedMessages(completion: @escaping (_ messages: [Message]) -> ()) {
        
        var messages = [Message]()
        
        REF_FEED.observeSingleEvent(of: .value) { (snapshot) in
            guard let feedMessageSnapshot = snapshot.children.allObjects as? [DataSnapshot] else { return }
            
            for message in feedMessageSnapshot {
                let content = message.childSnapshot(forPath: "content").value as! String
                let senderId = message.childSnapshot(forPath: "senderId").value as! String
                
                let message = Message(content: content, senderId: senderId)
                messages.append(message)
            }   
            completion(messages)
        }
    }
    
}
