//
//  HomeController.swift
//  vote-mhs-swift
//
//  Created by isa nur fajar on 28/11/19.
//  Copyright © 2019 isa nur fajar. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

class HomeController: UITabBarController {
    var username : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
//        let values = [ "Place" : 10]
        let rootRef = Database.database().reference().root.child("candidate").updateChildValues([ "totalVote": 20])
        
    }
}
