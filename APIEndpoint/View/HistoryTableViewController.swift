//
//  HistoryTableViewController.swift
//  APIEndpoint
//
//  Created by pc2020 on 2021/2/25.
//

import UIKit
import Combine
import Async

class HistoryTableViewController: UITableViewController {
    var dataSource = [PassData]() {
        didSet {
            if dataSource.count > 0 {
                reload()
            }
        }
    }
    
    var updateCancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = endpointURL
        dataSource = CDManage.share.endPointDatas.map{ ($0.jsonData, $0.timeStamp) }
        makeSink()
    }
    
    func makeSink() {
        updateCancellable = CDManage.share.updateSubject.sink(receiveCompletion: { (comp) in }, receiveValue: { [unowned self] in
            self.dataSource.insert($0, at: 0)
        })
    }
    
    func reload() {
        Async.main {
            self.tableView.reloadData()
            self.tableView.reloadRows(at: [IndexPath(row: 0, section: 0)], with: .left)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusable(class: UITableViewCell.self, for: indexPath)
        cell.accessoryType = .disclosureIndicator
        let obj = dataSource[indexPath.row]
        cell.textLabel?.text = obj.timeStamp.toDateString()
        cell.detailTextLabel?.text = obj.data.toString()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let obj = dataSource[indexPath.row]
        let destinationVC = UIStoryboard.load(controller: DetailViewController.self)
        destinationVC.singlePoint = obj
        navigationController?.show(destinationVC, sender: nil)
    }

    deinit {
        logDebug("deinit: \(HistoryTableViewController.className)")
    }
}
