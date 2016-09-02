//
//  PDropDownMenuView.swift
//  PTapTitleTable
//
//  Created by 邓杰豪 on 2016/9/2.
//  Copyright © 2016年 邓杰豪. All rights reserved.
//

import UIKit

protocol PDropDownMenuDelegate {
    func dropdownMenuDidDismiss(menu: PDropDownMenuView)
    func dropdownMenuDidShow(menu:PDropDownMenuView)
}

class PDropDownMenuView: UIView
{
    var delegate : PDropDownMenuDelegate?
    var _contentController : UIViewController?
    var _containerView : UIImageView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()

        _containerView = UIImageView()
        _containerView?.backgroundColor = UIColor.clearColor()
        _containerView!.userInteractionEnabled = true
        self.addSubview(_containerView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setContentController(contentController:UIViewController) {
        _contentController = contentController
        let content:UIView = contentController.view
        content.frame.origin.x = 7
        content.frame.origin.y = 13
        _containerView!.frame.size.height = CGRectGetMaxY(content.frame) + 9
        _containerView!.frame.size.width = CGRectGetMaxX(content.frame) + 7;
        _containerView!.addSubview(content)
    }

    func showFrom(from:UIView)
    {
        let window:UIWindow = UIApplication.sharedApplication().windows.last!
        window.addSubview(self)
        self.frame = window.bounds
        let newFrame:CGRect = from.convertRect(from.bounds, toView: window)
        _containerView!.center.x = CGRectGetMidX(newFrame)
        _containerView!.frame.origin.y = CGRectGetMaxY(newFrame)
        self.delegate!.dropdownMenuDidShow(self)
    }

    func dismiss()
    {
        self.removeFromSuperview()
        self.delegate?.dropdownMenuDidDismiss(self)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        dismiss()
    }
}
