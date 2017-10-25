//
//  DetailViewController.swift
//  HomePwner Pro
//
//  Created by 华海智 on 2017/10/25.
//  Copyright © 2017年 海志. All rights reserved.
//

import UIKit
class DetailViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var nameField: XTextField!
    @IBOutlet var numberField: XTextField!
    @IBOutlet var ageField: XTextField!
    @IBOutlet var createdDateLabel : UILabel!
    
    
    var user: User! {
        didSet {
            navigationItem.title = user.name
        }
    }
 
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter.init()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = user.name
        numberField.text = user.number
        ageField.text = "\(user.age)"
        createdDateLabel.text = dateFormatter.string(from: user.createdDate)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
        
        user.name = nameField.text!
        user.number = numberField.text!
        user.age = (NumberFormatter.init().number(from: ageField.text!)?.intValue)!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    

    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
}
