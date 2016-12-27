//
//  ViewController.swift
//  CustomFonts
//
//  Created by 赵瑞生 on 2016/12/26.
//  Copyright © 2016年 赵瑞生. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var data = [ "《生活不止眼前的苟且》",
                 "妈妈坐在门前，哼着花儿与少年",
                 "虽已时隔多年，记得她泪水涟涟",
                 "那些幽暗的时光，那些坚持与慌张",
                 "在临别的门前，妈妈望着我说",
                 "生活不止眼前的苟且，还有诗和远方的田野",
                 "你赤手空拳来到人世间，为找到那片海不顾一切",
                 "                                                         --- 许巍"]
    //字体名字
    let fontNames = ["Copperplate-Bold", "Copperplate","Copperplate-Light"]
    var fontRowIndex = 0
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var changeFontButton: UIButton!
    @IBOutlet weak var fontTableView: UITableView!

    @IBAction func changeFontAction(_ sender: UIButton) {
        
        fontRowIndex = (fontRowIndex + 1) % 3
        fontTableView.reloadData()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //设置代理和数据源为self
        fontTableView.delegate = self;
        fontTableView.dataSource = self;
        
        //遍历电脑字体
        for family in UIFont.familyNames {
            for font in UIFont.fontNames(forFamilyName: family) {
                print(font)
            }
        }
        
        //改变按钮样式
        changeFontButton.layer.cornerRadius = 55
        
    }
    
    //返回行高
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //设置单元格样式
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: "FontCell", for: indexPath)
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont(name: self.fontNames[fontRowIndex], size: 16)
        return cell
    }
    
    //数据源协议
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

