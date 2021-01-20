//
//  SecondViewController.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 06.01.2021.
//

import UIKit

protocol SecondViewControllerDelegate {
    func removeItem(_ id: Int)
    func editItem(_ id: Int)
}

class SecondViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, AddTask, ToChangeCheck {
        
    @IBOutlet weak var tableView: UITableView!
    var arr : [ToDoItem] = []
    let cellId = "TableViewCell"
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
        testDataConfigure()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main page"
        self.configureTableView()
    }

    func testDataConfigure(){
        arr.append(ToDoItem(id: 1, title: "first", deadline: "2021-12-20"))
        arr.append(ToDoItem(id: 2, title: "second", deadline: "22.12.2021"))
        arr.append(ToDoItem(id: 3, title: "third", deadline: "12.08.2021"))
        arr.append(ToDoItem(id: 4, title: "uno", deadline: "05.07.2021"))
        arr.append(ToDoItem(id: 5, title: "dos", deadline: "29.12.2021"))
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(identifier: "AddPageViewController") as! AddPageViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        let item = arr[indexPath.row]
        cell.id = item.id
        cell.titleLabel.text = item.title
        cell.subTitleLabel.text = item.deadline
        if item.checked {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxFILLED "), for: UIControl.State.normal)
        }
        else{
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkBoxOUTLINE "), for: UIControl.State.normal)
        }
        
        cell.delegate = self
        cell.index = indexPath.row
        cell.todo = arr

        return cell
    }
    
    func checkkk(checked: Bool, index: Int) {
        arr[index].checked = checked
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: UITableView.RowAnimation.none)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            removeItem(indexPath.row)
                        tableView.deleteRows(at: [indexPath], with: .fade)
        }else if editingStyle == .insert{
            print("insert")
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddPageViewController
        vc.delegate = self
    }
    
    func addTask(id: Int, title: String, deadline: String) {
        arr.append(ToDoItem(id: id, title: title, deadline: deadline))
        tableView.reloadData()
    }
    
}

extension SecondViewController: SecondViewControllerDelegate{
    
    func removeItem(_ id: Int) {
        arr.remove(at: id)
    }
    
    func editItem(_ id: Int) {
        //open new view controller which allows you to change the data of the array item
    }
 
}


class ToDoItem{
    var id = 0
    var title = ""
    var deadline = ""
    var checked = false

    convenience init(id: Int,title: String,deadline: String){
        self.init()
        self.id = id
        self.title = title
        self.deadline = deadline
    }
}
