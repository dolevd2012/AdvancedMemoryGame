//
//  TableViewController.swift
//  memorygame
//
//  Created by user196688 on 6/1/21.
//

import UIKit

class TableViewController: UIViewController {
var playersData : [sharedPrefValue] = []
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        playersData = CollectionViewController().getAllUserData()
    }
    

}
extension TableViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)as! TableViewCell
        if(indexPath.row == 0){
            cell.tableNameLabel.text = "Name"
            cell.tableTimeLabel.text = "Time"
            return cell
        }
        else{
            cell.tableNameLabel.text = playersData[indexPath.row].playerName
            cell.tableTimeLabel.text = "\(playersData[indexPath.row].timeTaken)"
            return cell

        }
    }

}
