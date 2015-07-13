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
    @IBOutlet weak var selectCosmeticView: UIView!
    @IBOutlet weak var submitView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let selectCategoryTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "selectCategoryTapped:")
        let selectBrandTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "selectBrandTapped:")
        let selectCosmeticTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "selectCosmeticTapped:")
        let submitTapGestureRecognizer = UITapGestureRecognizer(target: self, action: "submitTapped:")

        self.selectCategoryView.addGestureRecognizer(selectCategoryTapGestureRecognizer)
        self.selectBrandView.addGestureRecognizer(selectBrandTapGestureRecognizer)
        self.selectCosmeticView.addGestureRecognizer(selectCosmeticTapGestureRecognizer)
        self.submitView.addGestureRecognizer(submitTapGestureRecognizer)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func selectCategoryTapped(sender: UITapGestureRecognizer) {
        print("selectCategoryTapped")
    }

    func selectBrandTapped(sender: UITapGestureRecognizer) {
        print("selectBrandTapped")
    }

    func selectCosmeticTapped(sender: UITapGestureRecognizer) {
        print("selectCosmeticTapped")
    }

    func submitTapped(sender: UITapGestureRecognizer) {
        print("submitTapped")
    }

}