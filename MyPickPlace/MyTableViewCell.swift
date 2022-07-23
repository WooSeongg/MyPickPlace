//
//  MyTableViewCell.swift
//  MyPickPlace
//
//  Created by 미미밍 on 2022/01/20.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var shopimg: UIImageView!
    @IBOutlet weak var txtjuso: UILabel!
    @IBOutlet weak var txtCategory: UILabel!
    @IBOutlet weak var txtName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
