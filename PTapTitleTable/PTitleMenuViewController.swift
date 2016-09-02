//
//  PTitleMenuViewController.swift
//  PTapTitleTable
//
//  Created by 邓杰豪 on 2016/9/2.
//  Copyright © 2016年 邓杰豪. All rights reserved.
//

import UIKit

protocol PTitleMenuDelegate {
    func didTapFootViewAction()
    func selectAtIndexPath(indexPath:NSIndexPath,title:NSString)
    func didDeleteCellActWithTitleName(indexPath:NSIndexPath)
}

class PTitleMenuViewController: UITableViewController {

    var delegate : PTitleMenuDelegate?
    var dropdownMenuView = PDropDownMenuView()
    var data = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let models : CBTitleViewModel? = data[indexPath.row] as? CBTitleViewModel

        var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("11111111")

        if cell == nil {
            cell = UITableViewCell.init(style:.Subtitle, reuseIdentifier: "11111111")
        }

        cell!.textLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 18)
        cell!.textLabel?.text = models?.titleStr
        return cell!
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        dropdownMenuView.dismiss()
        if delegate != nil {
            let models : CBTitleViewModel? = data[indexPath.row] as? CBTitleViewModel
            delegate?.selectAtIndexPath(indexPath, title: (models?.titleStr)!)
        }
    }

    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }

    override func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let fView:UIView? = UIView.init(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))

        let btn:UIButton? = UIButton.init(type: .Custom)
        btn?.frame = CGRectMake(5, 0, self.view.frame.size.width-10, 50)
        btn?.backgroundColor = UIColor.redColor()
        btn?.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn?.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 18)
        btn?.setTitle("添加大类", forState: .Normal)
        btn?.addTarget(self, action: #selector(self.btnTouch(_:)), forControlEvents: .TouchUpInside)
        fView?.addSubview(btn!)
        return fView
    }

    override func tableView(tableView: UITableView, titleForDeleteConfirmationButtonForRowAtIndexPath indexPath: NSIndexPath) -> String? {
        return "删除"
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            if delegate != nil {
                delegate?.didDeleteCellActWithTitleName(indexPath)
            }
        }
    }

    func btnTouch(sender:UIButton)
    {
        if delegate != nil {
            delegate?.didTapFootViewAction()
        }
    }
}
