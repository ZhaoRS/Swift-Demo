//
//  ViewController.swift
//  Project20-CollapsibleTableSection
//
//  Created by 赵瑞生 on 2017/1/22.
//  Copyright © 2017年 赵瑞生. All rights reserved.
//

import UIKit

struct Section {
    var name: String!
    var items: [String]!
    var collapsed: Bool!
    
    init(name: String, items: [String]) {
        self.name = name
        self.items = items
        self.collapsed = false
    }
    
}

var sections = [Section]()


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        sections = [
            Section(name: "Farrari", items: ["LaFerrari", "Enzo", "F40", "F50", "288GTO", "FXX K","FXX"]),
            Section(name: "Lamborghini", items: ["Aventador", "Reventon", "Huracan", "Gallardo", "Sesto Elemento", "Veneno", "Centenario", "Diablo"]),
            Section(name: "Aston Martin", items: ["One-77", "Vanquish", "Vulcan", "Vantage", "Rapide", "DBS", "DB11"]),
            Section(name: "Porsche", items: ["918 Spyder", "Cayenne", "Macan", "911 Turbo S", "Panamera", "Carrera GT"])]
        
    }
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (sections[section].collapsed == true) {
            return 0
        } else {
            return sections[section].items.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "header") as! CollapsibleHeader
        
        header.unfoldButton.tag = section
        header.brandLabel.text = sections[section].name
        
        header.unfoldButton.rotate(sections[section].collapsed! ? 0.0 : CGFloat(M_PI_2))
        
        return header.contentView
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = sections[indexPath.section].items[indexPath.row]
        
        return cell
    }

    //按钮点击事件
    @IBAction func unfoldBtnDidTouch(_ sender: Any) {
        
        let button = sender as! UIButton
        
        let section = button.tag
        let collapsed = sections[section].collapsed
        
        //点击后改变状态
        sections[section].collapsed = !collapsed!
        
        
        //重载section的数据
        tableView.reloadSections(IndexSet(integer: section), with: .automatic)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
//MARK: 扩展
extension UIView {
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.toValue = toValue
        rotateAnimation.duration = duration
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.fillMode = kCAFillModeForwards
        
        //        if let delegate: AnyObject = completionDelegate {
        //            rotateAnimation.delegate = delegate
        //        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
