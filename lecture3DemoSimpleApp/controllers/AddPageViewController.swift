//
//  AddPageViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by Еркебулан on 19.01.2021.
//

import UIKit

protocol AddTask {
    func addTask(id: Int,title: String,deadline: String)
}

class AddPageViewController: UIViewController {
    
    @IBAction func addButton(_ sender: Any) {
        if insertTaskField.text != "" || insertDeadlineField.text != ""{
            delegate?.addTask(id: Int(insertIdField!.text!) ?? 0, title: insertTaskField.text!, deadline: insertDeadlineField.text!)
            navigationController?.popViewController(animated: true)
        }
    }
    @IBOutlet weak var insertTaskField: UITextField!
    @IBOutlet weak var insertDeadlineField: UITextField!
    @IBOutlet weak var insertIdField: UITextField!
    
    var delegate: AddTask?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add page"
    }
    
    
}
