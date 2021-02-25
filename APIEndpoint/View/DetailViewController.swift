//
//  DetailViewController.swift
//  APIEndpoint
//
//  Created by pc2020 on 2021/2/25.
//

import UIKit
import Async

class DetailViewController: BaseController {
    
    var singlePoint: (data: Data, timeStamp: TimeInterval)!
    
    @IBOutlet weak var originTextView: UITextView! {
        didSet {
            originTextView.contentInsetAdjustmentBehavior = .never
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = self.singlePoint?.timeStamp.toDateString()
        if let m = self.singlePoint?.data.transform(to: Endpoint.self) {
            self.originTextView.text = "\(m)"
        }
        
    }
    
}
