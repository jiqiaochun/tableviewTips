//
//  ViewController.swift
//  tableviewTips
//
//  Created by qiaochun ji on 2018/7/11.
//  Copyright © 2018年 qiaochun ji. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    let textValue:NSString = "这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n这是测试内容\n"
    
    var dict:Dictionary<String,String> = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let lable = cell.contentView.viewWithTag(1000) as! UILabel
        lable.text = textValue as String
        
        if dict[String(indexPath.row)] == "0" {
            lable.numberOfLines = 0
        }else{
            lable.numberOfLines = 1
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let label = cell!.contentView.viewWithTag(1000) as! UILabel
        
        tableView.beginUpdates()
        if label.numberOfLines == 0 {
            label.numberOfLines = 1
            dict[String(indexPath.row)] = "1"
        }else{
            label.numberOfLines = 0
            dict[String(indexPath.row)] = "0"
        }
        tableView.endUpdates()
//        tableView.reloadData()
    }
    
}

