//
//  ViewController.swift
//  Project19-HeaderTableView
//
//  Created by 赵瑞生 on 2017/1/10.
//  Copyright © 2017年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ferrari = ["LaFerrari", "Enzo", "F50", "F40", "F12 TDF"]
    var lamborghini = ["Aventador", "Huracan", "Veneno", "Murcielago", "Reventon"]
    var astonMartin = ["One-77", "Vulcan", "Vanquish", "Vantage", "DB11"]
    var porsche = ["918 Spyder", "911 GT3", "Carrera GT", "Panamera", "Cayenne"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = ferrari[indexPath.row]
        case 1:
            cell.textLabel?.text = lamborghini[indexPath.row]
        case 2:
            cell.textLabel?.text = astonMartin[indexPath.row]
        case 3:
            cell.textLabel?.text = porsche[indexPath.row]
        default:
            cell.textLabel?.text = ""
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! HeaderCell
        headerCell.backgroundColor = UIColor.gray
        
        switch section {
        case 0:
            headerCell.titleLabel.text = " Ferrari"
        case 1:
            headerCell.titleLabel.text = " Lamborghini"
        case 2:
            headerCell.titleLabel.text = " Aston Martin"
        case 3:
            headerCell.titleLabel.text = " Porsche"
            
        default:
            headerCell.titleLabel.text = ""
        }
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35;
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

