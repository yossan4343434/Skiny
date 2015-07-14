//
//  SKSelectItemListViewController.swift
//  Skiny
//
//  Created by Yoshiyuki Kuga on 2015/07/13.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

import UIKit

class SKSelectItemListViewController: UIViewController {

    var selectItemType = NSInteger()

    override func viewDidLoad() {
        super.viewDidLoad()

        switch selectItemType {
        case 0:
            self.title = "カテゴリを選択"
            break
        case 1:
            self.title = "ブランドを選択"
            break
        case 2:
            self.title = "商品名を選択"
            break
        default:
            break
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
