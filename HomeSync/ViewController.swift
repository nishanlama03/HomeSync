//
//  ViewController.swift
//  HomeSync
//
//  Created by Nishan Lama on 4/30/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var calendarTableView: UITableView!
    @IBOutlet weak var taskTableView: UITableView!
    var todaysTasks = ["Buy groceries", "Do laundry", "Finish homework"]
    var tomorrowsTasks = ["Buy groceries", "Do laundry", "Finish homework"]
    
    struct EventInfo {
        var name: String
        var date: Date
        var location: String
    }

    
    var events: [EventInfo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        taskTableView.dataSource = self
        taskTableView.delegate = self
        // Do any additional setup after loading the view.
        calendarTableView.dataSource = self
        calendarTableView.delegate = self
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, h:mm a"
        events = [
           EventInfo(name:"Roomate meeting", date: formatter.date(from: "May 07, 2:00 PM")!, location:"Living Room"),
           EventInfo(name:"Picnic", date: formatter.date(from: "May 03, 3:00 PM")!, location:"Park")]
        
        events.sort { $0.date < $1.date }

 
    }
   

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == calendarTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarCell", for:indexPath ) as! CalendarTableViewCell
            let event = events[indexPath.row]
            cell.eventNameLabel.text = event.name

            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd, h:mm a"
            cell.eventDateLabel.text = formatter.string(from: event.date)
            cell.eventLocationLabel.text = event.location
            return cell
        }else if tableView == taskTableView{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
            if indexPath.section == 0{
                cell.taskLabel.text = todaysTasks[indexPath.row]
            }else{
                cell.taskLabel.text = tomorrowsTasks[indexPath.row]
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == calendarTableView{
            return 100
        }else{
            return 80
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == calendarTableView{
            return min(events.count, 1)
        }else{
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if tableView == calendarTableView {
            return events.count
        }else {
            switch section{
            case 0: return todaysTasks.count
            case 1: return tomorrowsTasks.count
            default: return 0
            }
        }
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == taskTableView{
            switch section {
            case 0: return "Today's Tasks"
            case 1: return "Tomorrow's Tasks"
            default: return nil
            }
        }
        return nil
        
    }
    

    
    

}

