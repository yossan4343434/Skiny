//
//  SKUserItemListViewController.swift
//  Skiny
//
//  Created by Yoshiyuki Kuga on 2015/07/11.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

import UIKit

class SKUserItemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var userItemListTableView: UITableView!

    let userItem = [["category": "化粧水", "brand": "無印良品", "name": "化粧水・敏感肌用 高保湿タイプ"], ["category": "化粧水", "brand": "無印良品", "name": "化粧水・敏感肌用 高保湿タイプ"], ["category": "化粧水", "brand": "無印良品", "name": "化粧水・敏感肌用 高保湿タイプ"]]

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib: UINib = UINib(nibName: "SKUserItemListCell", bundle: nil)
        self.userItemListTableView.registerNib(nib, forCellReuseIdentifier: "UserItemListCell")

        self.userItemListTableView.delegate = self
        self.userItemListTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userItem.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: SKUserItemListCell = tableView.dequeueReusableCellWithIdentifier("UserItemListCell", forIndexPath: indexPath) as SKUserItemListCell
        cell.userItemImageView.image = UIImage(named: "dummy.jpg")
        cell.userItemCategoryLabel.text = userItem[indexPath.row]["category"]
        cell.userItemBrandLabel.text = userItem[indexPath.row]["brand"]
        cell.userItemNameLabel.text = userItem[indexPath.row]["name"]
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return SKUserItemListCell.cellHeight()
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("hello")
    }
    
}
