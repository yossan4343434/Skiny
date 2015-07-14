//
//  SKSelectItemListViewController.swift
//  Skiny
//
//  Created by Yoshiyuki Kuga on 2015/07/13.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

import UIKit

class SKSelectItemListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var selectItemType = NSInteger()
    var selectItemKey = NSString()
    var selectItemList = NSArray()
    var selectedContent = NSString()

    @IBOutlet weak var selectItemListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        switch selectItemType {
        case 0:
            self.title = "カテゴリを選択"
            self.selectItemKey = "category"
            break
        case 1:
            self.title = "ブランドを選択"
            self.selectItemKey = "brand"
            break
        case 2:
            self.title = "商品名を選択"
            self.selectItemKey = "name"
            break
        default:
            break
        }

        self.selectItemListTableView.delegate = self
        self.selectItemListTableView.dataSource = self

        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func loadData() {
        if let path = NSBundle.mainBundle().pathForResource("sample", ofType: "json") {
            if let jsonData = NSData(contentsOfFile: path) {
                let jsonResult = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.AllowFragments, error: nil) as! NSDictionary
                selectItemList = jsonResult[self.selectItemKey] as! NSArray
            }
        }
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectItemList.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("selectItemListCell", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel?.text = selectItemList[indexPath.row]["name"] as? String

        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedContent = selectItemList[indexPath.row]["name"] as! String
        performSegueWithIdentifier("didSelectContent", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "didSelectContent" {
            var addItemViewController = SKAddItemViewController()
            addItemViewController = segue.destinationViewController as! SKAddItemViewController

            switch selectItemType {
            case 0:
                addItemViewController.categoryLabel.text = selectedContent as String
                break
            case 1:
                addItemViewController.brandLabel.text = selectedContent as String
                break
            case 2:
                addItemViewController.nameLabel.text = selectedContent as String
                break
            default:
                break
            }
        }
    }

}
