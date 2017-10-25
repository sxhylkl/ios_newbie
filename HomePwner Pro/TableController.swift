//
//  ViewController.swift
//  HomePwner Pro
//
//  Created by 华海智 on 2017/10/24.
//  Copyright © 2017年 海志. All rights reserved.
//

import UIKit

class TableController:UITableViewController {

    var user: UserStore!
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func addNewUser(sender: AnyObject){
        let newUser = user.createUser()
        let lastRow : Int
        let section : Int
        if newUser.age > 10 {
            section = 0
            lastRow = user.getUsersAgeMoreThan10().index(of: newUser)!
        }else {
            section = 1
            lastRow = user.getUsersAgeLessThan10().index(of: newUser)!
        }
        let indexPath = NSIndexPath.init(row: lastRow, section: section)
        tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
    }
    
    // 返回每组的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var section1 = 0
        var section2 = 0
        for item in user.userList {
            if item.age > 10 {
                section1 = section1 + 1
            } else {
                section2 = section2 + 1
            }
        }
        if section == 0 {
            return section1
        }else {
            return section2
        }
    }
    
    //返回组数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2;
    }
    
    //返回每组的title
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "年龄大于10"
        }else{
            return "年龄小于10"
        }
    }
    
    //返回每组每行的Item
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.updateLabels()
        if indexPath.section == 0{
            let userItem = user.getUsersAgeMoreThan10()[indexPath.row]
            cell.nameLabel?.text = userItem.name
            cell.ageLabel?.text = "年龄：\(userItem.age)"
            cell.numberLabel?.text = userItem.number
            cell.backgroundColor = UIColor.green
        } else {
            let userItem = user.getUsersAgeLessThan10()[indexPath.row]
            cell.nameLabel?.text = userItem.name
            cell.ageLabel?.text = "年龄：\(userItem.age)"
            cell.numberLabel?.text = userItem.number
            cell.backgroundColor = UIColor.red
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        if sourceIndexPath.section != proposedDestinationIndexPath.section {
            return sourceIndexPath
        }else {
            return proposedDestinationIndexPath
        }
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController.init(title: "确定要删除该项吗？", message: "点击确定将删除该项，此操作不可恢复", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction.init(title: "删除", style: .destructive, handler:
                {(action) -> Void in
                if indexPath.section == 0 {
                    self.user.removeItem(item: self.user.getUsersAgeMoreThan10()[indexPath.row])
                }else {
                    self.user.removeItem(item: self.user.getUsersAgeLessThan10()[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath], with: .fade)
            }))
            alert.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))
            present(alert, animated: true, completion:
                {
                NSLog("更新完成")
            })
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        if sourceIndexPath.section == destinationIndexPath.section {
            user.moveItem(from: sourceIndexPath.row, to: sourceIndexPath.row)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowItem" {
            if let currentIndex = tableView.indexPathForSelectedRow {
                let detailViewController = segue.destination as! DetailViewController
                if currentIndex.section == 0 {
                    detailViewController.user = self.user.getUsersAgeMoreThan10()[currentIndex.row]
                }else {
                    detailViewController.user = self.user.getUsersAgeLessThan10()[currentIndex.row]
                }
            }
        }
    }
}

