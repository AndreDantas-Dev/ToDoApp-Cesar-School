//
//  TodoTableViewCell.swift
//  TodoApp
//
//  Created by aluno on 20/06/20.
//  Copyright © 2020 aluno. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {


    @IBOutlet weak var taskLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
