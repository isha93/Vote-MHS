//
//  VoteController.swift
//  vote-mhs-swift
//
//  Created by isa nur fajar on 28/11/19.
//  Copyright © 2019 isa nur fajar. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase


class VoteController: UIViewController {
    var pointVote : Int? = 0
    @IBAction func voteBtn(_ sender: UIButton) {
        vote(vote: pointVote! + 1)
        self.getData()
    }
    @IBOutlet weak var point: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
    }
    func vote(vote : Int) {
        let rootRef = Database.database().reference().root.child("candidate").updateChildValues([ "totalVote": vote])
    }
    func getData () {
        let rootRef = Database.database().reference().root.child("candidate").observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
          let value = snapshot.value as? NSDictionary
            let pointValue = value?["totalVote"] as? Int ?? 0
            self.pointVote = pointValue
            let pointStr = String(pointValue)
            self.point.text = pointStr
            print(pointStr)
          }) { (error) in
            print(error.localizedDescription)
        }

    }
}
