//
//  FeedbackViewController.swift
//  TriviaGame
//
//  Created by Lhais Rodrigues Silva on 21/11/17.
//  Copyright © 2017 Lhais Rodrigues Silva. All rights reserved.
//

import Foundation
import UIKit


class FeedbackViewController: UIViewController {
    
    var myLabel: String = ""
    
    @IBOutlet weak var myLabelFeedback: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myLabelFeedback.text = myLabel
    }
    
    
}
