//
//  SKUserItemListCell.swift
//  Skiny
//
//  Created by Yoshiyuki Kuga on 2015/07/11.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

import UIKit

class SKUserItemListCell: UITableViewCell {

    @IBOutlet weak var userItemImageView: UIImageView!
    @IBOutlet weak var userItemCategoryLabel: UILabel!
    @IBOutlet weak var userItemBrandLabel: UILabel!
    @IBOutlet weak var userItemNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    class func cellHeight() -> CGFloat {
        return 120
    }
    
}
