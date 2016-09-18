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
    func selectAtIndexPath(_ indexPath:IndexPath,title:NSString)
    func didDeleteCellActWithTitleName(_ indexPath:IndexPath)
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let models : CBTitleViewModel? = data[(indexPath as NSIndexPath).row] as? CBTitleViewModel

        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "11111111")

        if cell == nil {
            cell = UITableViewCell.init(style:.subtitle, reuseIdentifier: "11111111")
        }

        cell!.textLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 18)
        cell!.textLabel?.text = models?.titleStr
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        dropdownMenuView.dismiss()
        if delegate != nil {
            let models : CBTitleViewModel? = data[(indexPath as NSIndexPath).row] as? CBTitleViewModel
            delegate?.selectAtIndexPath(indexPath, title: (models?.titleStr)! as NSString)
        }
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let fView:UIView? = UIView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))

        let btn:UIButton? = UIButton.init(type: .custom)
        btn?.frame = CGRect(x: 5, y: 0, width: self.view.frame.size.width-10, height: 50)
        btn?.backgroundColor = UIColor.red
        btn?.setTitleColor(UIColor.white, for: UIControlState())
        btn?.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Regular", size: 18)
        btn?.setTitle("添加大类", for: UIControlState())
        btn?.addTarget(self, action: #selector(self.btnTouch(_:)), for: .touchUpInside)
        fView?.addSubview(btn!)
        return fView
    }

    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if delegate != nil {
                delegate?.didDeleteCellActWithTitleName(indexPath)
            }
        }
    }

    func btnTouch(_ sender:UIButton)
    {
        if delegate != nil {
            delegate?.didTapFootViewAction()
        }
    }
}
