//
//  MenuCellTableViewCell.swift
//  MyPickPlace
//
//  Created by 미미밍 on 2022/01/21.
//

import UIKit

class MenuCellTableViewCell: UITableViewCell {

    
    @IBOutlet weak var menuPrice: UILabel!
    @IBOutlet weak var menuTitle: UILabel!
    @IBOutlet weak var menuPic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
