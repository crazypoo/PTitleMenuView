//
//  ViewController.swift
//  PTapTitleTable
//
//  Created by 邓杰豪 on 2016/9/2.
//  Copyright © 2016年 邓杰豪. All rights reserved.
//

import UIKit

class ViewController: UIViewController,PDropDownMenuDelegate,PTitleMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.view.backgroundColor = UIColor.whiteColor()

        let btn:UIButton? = UIButton.init(type: .Custom)
        btn?.frame = CGRectMake(5, 0, self.view.frame.size.width-10, 50)
        btn?.backgroundColor = UIColor.redColor()
        btn?.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn?.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 18)
        btn?.setTitle("添加大类", forState: .Normal)
        btn?.addTarget(self, action: #selector(self.btnTouch(_:)), forControlEvents: .TouchUpInside)
        self.navigationItem.titleView = btn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func btnTouch(sender:UIButton)
    {
        NSLog("lllll")

        let dropdownMenuViews:PDropDownMenuView? = PDropDownMenuView()
        dropdownMenuViews?.delegate = self

        let titleMenuVC:PTitleMenuViewController? = PTitleMenuViewController()
        titleMenuVC?.dropdownMenuView = dropdownMenuViews!
        titleMenuVC?.delegate = self

        let model = CBTitleViewModel()
        model.titleID = "1111"
        model.titleStr = "2222222"

        titleMenuVC?.data.addObject(model)
//        dropdownMenuViews?._contentController = titleMenuVC!
        dropdownMenuViews?.setContentController(titleMenuVC!)
        dropdownMenuViews?.showFrom(sender)
    }

    func dropdownMenuDidShow(menu: PDropDownMenuView) {

    }

    func dropdownMenuDidDismiss(menu: PDropDownMenuView) {

    }

    func selectAtIndexPath(indexPath: NSIndexPath, title: NSString) {

    }

    func didDeleteCellActWithTitleName(indexPath: NSIndexPath) {

    }

    func didTapFootViewAction() {

    }
}

