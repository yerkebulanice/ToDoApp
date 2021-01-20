//
//  TableViewCell.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 06.01.2021.
//

import UIKit

protocol ToChangeCheck  {
    func checkkk(checked: Bool, index: Int)
}

class TableViewCell: UITableViewCell {

        @IBOutlet weak var edit: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var checkBoxOutlet: UIButton!
    
    @IBAction func checkBoxAction(_ sender: Any) {
        if todo![index!].checked {
            delegate?.checkkk(checked: false, index: index!)
        }else{
            delegate?.checkkk(checked: true, index: index!)
        }
    }
    
    @IBOutlet weak var subTitleLabel: UILabel!
    var delegate: ToChangeCheck?
    var index: Int?
    var todo: [ToDoItem]?
    var id = 0

    var editCallback: ((_ id: Int) -> Void)?
    var removeCallback: ((_ id: Int) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func editAction(_ sender: Any) {
        editCallback?(id)
        
    }
    
}
