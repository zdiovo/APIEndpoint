//
//  DetailViewController.swift
//  APIEndpoint
//
//  Created by pc2020 on 2021/2/25.
//

import UIKit
import Async


class DetailController: UITableViewController {
    var singlePoint: (data: Data, timeStamp: TimeInterval)!
    var dataSource:[Mirror.Child] = []
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if dataSource.count > 0 {
            return
        }
        if let m = self.singlePoint?.data.JSON(to: Endpoint.self) {
            dataSource = Mirror(reflecting: m).children.compactMap { $0 }
            self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
            logInfo(dataSource.count)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusable(class: DetailCell.self, for: indexPath)
        cell.fill(with: dataSource[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        logInfo(indexPath)
    }

    deinit {
        logDebug(#function)
    }
}
