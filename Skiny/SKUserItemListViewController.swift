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

    var userItems = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib: UINib = UINib(nibName: "SKUserItemListCell", bundle: nil)
        self.userItemListTableView.registerNib(nib, forCellReuseIdentifier: "userItemListCell")

        self.userItemListTableView.delegate = self
        self.userItemListTableView.dataSource = self

        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadData() {
        if let path = NSBundle.mainBundle().pathForResource("sample", ofType: "json") {
            if let jsonData = NSData(contentsOfFile: path) {
                let jsonResult = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSDictionary
                userItems = jsonResult["user_item"] as! NSArray
            }
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: SKUserItemListCell = tableView.dequeueReusableCellWithIdentifier("userItemListCell", forIndexPath: indexPath) as! SKUserItemListCell

        cell.userItemCategoryLabel.text = userItems[indexPath.row]["category"] as? String
        cell.userItemBrandLabel.text = userItems[indexPath.row]["brand"] as? String
        cell.userItemNameLabel.text = userItems[indexPath.row]["name"] as? String
        let imageName = NSString(string: userItems[indexPath.row]["image"] as! String)
        cell.userItemImageView.image = UIImage(named: imageName as String)

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return SKUserItemListCell.cellHeight()
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("itemDetail", sender: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
}
