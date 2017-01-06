//
//  ViewController.swift
//  Project15-SwipeableCell
//
//  Created by 赵瑞生 on 2017/1/6.
//  Copyright © 2017年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    let data = [
        player(image: "1", name: " Tracy McGrady"),
        player(image: "2", name: " Kobe Bryant"),
        player(image: "3", name: " Michael Jordan"),
        player(image: "4", name: " Lebron James"),
        player(image: "5", name: " Dwight Howard"),
        player(image: "6", name: " Jeremy Lin"),
        player(image: "7", name: " Kevin Durant"),
        player(image: "8", name: " Steven Curry")
        
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //节数
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    //一节里的行数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    //cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell") as! PlayerCell
        let currentPlayer = data[indexPath.row]
        
        cell.playerName.text = currentPlayer.name
        cell.playerImage.image = UIImage(named: currentPlayer.image)
        
        return cell
    }
    
    //操作
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let like = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "喜欢", handler: { action, index in
            print("You hava tapped like button")
        })
        like.backgroundColor = UIColor.red
        
        let chat = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "聊聊", handler: { action, index in
            print("You have tapped chat button")
        })
        chat.backgroundColor = UIColor.blue
        
        let share = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "分享", handler: { (action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            let activityItem = self.data[indexPath.row]
            let activityViewController = UIActivityViewController(activityItems: [activityItem.image as String], applicationActivities: nil)
            
            self.present(activityViewController, animated: true, completion: nil)
        
        })
        share.backgroundColor = UIColor.yellow
        
        return [share, chat, like]
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    

    

}

