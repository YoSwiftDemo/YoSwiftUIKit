//
//  YoViewCtl.swift
//  YoViewCtl_Example
//
//  Created by admin on 2021/11/19.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import SnapKit
import YoCommon
/*
 布局导航条
 布局约束
 */
open class YoViewCtl: UIViewController {
    // MARK: init- navBarView  默认白色 只有左侧按钮
   open lazy var navBarView: YoNavBarView = {
        let navView = YoNavBarView.init()
        self.view.addSubview(navView)
        navView.leftBtn.setImage(UIImage.init(named: ""), for: .normal)
        navView.leftBtn.adjustsImageWhenHighlighted = false
        navView.backgroundColor = .white
        navView.delegate = self
       let path = Bundle.init(for: YoViewCtl.self).path(forResource: "YoViewCtlBundle", ofType: "bundle")
       if (path != nil) {
           let bundle = Bundle.init(path: path!)
           let image = UIImage.init(named: "yo_nav_bar_back_btn", in: bundle, compatibleWith: nil)
           navView.leftBtn.setImage(image, for: .normal)
        }
        return navView
    }()
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .green
        layoutViewCtl()
    }
    // MARK: - 布局 默认只有leftBtn 子类重写方法，或自己直接布局
    open func layoutViewCtl(){
        //导航view
        self.navBarView.snp_makeConstraints { make in
            make.top.left.right.equalTo(self.view)
            if kIsIphoneX() {
                make.height.equalTo(88)
            }else{
                make.height.equalTo(64)
            }
        }
        //按钮
        self.navBarView.leftBtn.backgroundColor = .white
        self.navBarView.leftBtn.snp_makeConstraints { make in
            make.left.equalTo(self.navBarView).offset(10)
            make.bottom.equalTo(self.navBarView).offset(-6)
            make.height.equalTo((44-6*2))
            make.width.equalTo((44-6*2))
        }
        //标题
        self.navBarView.titleLab.snp_makeConstraints { make in
            make.centerY.equalTo(self.navBarView.leftBtn)
            make.width.greaterThanOrEqualTo(0)
            make.height.greaterThanOrEqualTo(20)
            make.centerX.equalTo(self.navBarView)
        }
    }
}
 extension YoViewCtl: YoNavBarViewDelegate {
    //左侧按钮代理
    open func leftBtnActionEvent(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        //子类可以重写
    }
    //右侧按钮代理
    open func rightBtnActionEvent(_ sender: UIButton) {
        //子类可以重写
    }
}


