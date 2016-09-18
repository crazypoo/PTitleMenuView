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

        self.view.backgroundColor = UIColor.white

        let btn:UIButton? = UIButton.init(type: .custom)
        btn?.frame = CGRect(x: 5, y: 0, width: self.view.frame.size.width-10, height: 50)
        btn?.backgroundColor = UIColor.red
        btn?.setTitleColor(UIColor.white, for: UIControlState())
        btn?.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 18)
        btn?.setTitle("添加大类", for: UIControlState())
        btn?.addTarget(self, action: #selector(self.btnTouch(_:)), for: .touchUpInside)
        self.navigationItem.titleView = btn
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func btnTouch(_ sender:UIButton)
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

        titleMenuVC?.data.add(model)
//        dropdownMenuViews?._contentController = titleMenuVC!
        dropdownMenuViews?.setContentController(titleMenuVC!)
        dropdownMenuViews?.showFrom(sender)
    }

    func dropdownMenuDidShow(_ menu: PDropDownMenuView) {

    }

    func dropdownMenuDidDismiss(_ menu: PDropDownMenuView) {

    }

    func selectAtIndexPath(_ indexPath: IndexPath, title: NSString) {

    }

    func didDeleteCellActWithTitleName(_ indexPath: IndexPath) {

    }

    func didTapFootViewAction() {

    }
}

