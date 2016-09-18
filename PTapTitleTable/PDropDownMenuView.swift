//
//  PDropDownMenuView.swift
//  PTapTitleTable
//
//  Created by 邓杰豪 on 2016/9/2.
//  Copyright © 2016年 邓杰豪. All rights reserved.
//

import UIKit

protocol PDropDownMenuDelegate {
    func dropdownMenuDidDismiss(_ menu: PDropDownMenuView)
    func dropdownMenuDidShow(_ menu:PDropDownMenuView)
}

class PDropDownMenuView: UIView
{
    var delegate : PDropDownMenuDelegate?
    var _contentController : UIViewController?
    var _containerView : UIImageView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear

        _containerView = UIImageView()
        _containerView?.backgroundColor = UIColor.clear
        _containerView!.isUserInteractionEnabled = true
        self.addSubview(_containerView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setContentController(_ contentController:UIViewController) {
        _contentController = contentController
        let content:UIView = contentController.view
        content.frame.origin.x = 7
        content.frame.origin.y = 13
        _containerView!.frame.size.height = content.frame.maxY + 9
        _containerView!.frame.size.width = content.frame.maxX + 7;
        _containerView!.addSubview(content)
    }

    func showFrom(_ from:UIView)
    {
        let window:UIWindow = UIApplication.shared.windows.last!
        window.addSubview(self)
        self.frame = window.bounds
        let newFrame:CGRect = from.convert(from.bounds, to: window)
        _containerView!.center.x = newFrame.midX
        _containerView!.frame.origin.y = newFrame.maxY
        self.delegate!.dropdownMenuDidShow(self)
    }

    func dismiss()
    {
        self.removeFromSuperview()
        self.delegate?.dropdownMenuDidDismiss(self)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        dismiss()
    }
}
