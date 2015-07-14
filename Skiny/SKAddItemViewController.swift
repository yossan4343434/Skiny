//
//  SKAddItemViewController.swift
//  Skiny
//
//  Created by Yoshiyuki Kuga on 2015/07/11.
//  Copyright (c) 2015年 Gruppy. All rights reserved.
//

import UIKit

class SKAddItemViewController: UIViewController {

    @IBOutlet weak var selectCategoryView: UIView!
    @IBOutlet weak var selectBrandView: UIView!
    @IBOutlet weak var selectNameView: UIView!
    @IBOutlet weak var submitView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let selectCategoryTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "selectCategoryTapped:")
        let selectBrandTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "selectBrandTapped:")
        let selectNameTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "selectNameTapped:")
        let submitTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "submitTapped:")

        self.selectCategoryView.addGestureRecognizer(selectCategoryTapGestureRecognizer)
        self.selectBrandView.addGestureRecognizer(selectBrandTapGestureRecognizer)
        self.selectNameView.addGestureRecognizer(selectNameTapGestureRecognizer)
        self.submitView.addGestureRecognizer(submitTapGestureRecognizer)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func selectCategoryTapped(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("selectCategory", sender: nil)
    }

    func selectBrandTapped(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("selectBrand", sender: nil)
    }

    func selectNameTapped(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("selectName", sender: nil)
    }

    func submitTapped(sender: UITapGestureRecognizer) {
        print("submitTapped")
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var selectItemListViewController = SKSelectItemListViewController()
        selectItemListViewController = segue.destinationViewController as! SKSelectItemListViewController

        if segue.identifier == "selectCategory" {
            selectItemListViewController.selectItemType = 0 // typeCategory
            return
        } else if segue.identifier == "selectBrand" {
            selectItemListViewController.selectItemType = 1 // typeBrand
            return
        } else if segue.identifier == "selectName" {
            selectItemListViewController.selectItemType = 2 // typeName
            return
        }
    }

}
