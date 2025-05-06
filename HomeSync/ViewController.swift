//
//  ViewController.swift
//  HomeSync
//
//  Created by Nishan Lama on 4/30/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var taskTableView: UITableView!
    var todaysTasks = ["Buy groceries", "Do laundry", "Finish homework"]
    var tomorrowsTasks = ["Buy groceries", "Do laundry", "Finish homework"]

    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.dataSource = self
        taskTableView.delegate = self
        // Do any additional setup after loading the view.
 
    }
   

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        if indexPath.section == 0{
            cell.taskLabel.text = todaysTasks[indexPath.row]
        }else{
            cell.taskLabel.text = tomorrowsTasks[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func numberOfSections(in tableView: UITableView) -> Int { return 2 }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        switch section{
        case 0: return todaysTasks.count
        case 1: return tomorrowsTasks.count
        default: return 0
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Today's Tasks"
        case 1: return "Tomorrow's Tasks"
        default: return nil
        }
    }

    
    

}

