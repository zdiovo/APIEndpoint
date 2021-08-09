//
//  CurrentViewController.swift
//  APIEndpoint
//
//  Created by pc2020 on 2021/2/25.
//

import UIKit
import Async
import Combine

class CurrentViewController: BaseController {
    
    @IBOutlet weak var originDataTextView: UITextView!
    
    var updateCancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CDManage.share.prepare { (share) in
            share.fetchLast(self.updateContent(data:timeStamp:))
        }
        
        updateCancellable = CDManage.share.updateSubject.sink { (c) in } receiveValue: { (obj) in
            self.updateContent(data: obj.data, timeStamp: obj.timeStamp)
        }
    }
    
    func updateContent(data: Data, timeStamp: TimeInterval) {
        Async.main {
            UIView.transition(
                with: self.originDataTextView,
                duration: 0.35,
                options: .transitionFlipFromRight,
                animations: {
                self.originDataTextView.text = data.toString()
            }, completion: nil)
            self.navigationItem.title = timeStamp.toDateString()
        }
    }
}

