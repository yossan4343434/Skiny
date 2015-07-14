//
//  SKItemDetailViewController.swift
//  Skiny
//
//  Created by Yoshiyuki Kuga on 2015/07/12.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

import UIKit

class SKItemDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ingredients = NSArray()

    @IBOutlet weak var itemDetailTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let nib: UINib = UINib(nibName: "SKUserItemListCell", bundle: nil)
        self.itemDetailTableView.registerNib(nib, forCellReuseIdentifier: "userItemListCell")

        itemDetailTableView.delegate = self
        itemDetailTableView.dataSource = self

        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadData() {
        if let path = NSBundle.mainBundle().pathForResource("sample", ofType: "json") {
            if let jsonData = NSData(contentsOfFile: path) {
                let jsonResult = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSDictionary
                ingredients = jsonResult["ingredient"] as! NSArray
            }
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return ingredients.count
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell

        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCellWithIdentifier("userItemListCell", forIndexPath: indexPath) as! SKUserItemListCell
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("ingredientListCell", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = ingredients[indexPath.row]["name"] as? String
        }

        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return SKUserItemListCell.cellHeight()
        } else {
            return 44
        }
    }
}
