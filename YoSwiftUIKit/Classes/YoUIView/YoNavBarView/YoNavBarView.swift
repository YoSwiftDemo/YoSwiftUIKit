//
//  YoNavBarView.swift
//  YoNavBarView
//
//  Created by admin on 2021/11/18.
//

import Foundation
import UIKit

/*
  代理
  左侧按钮  代理event
  标题
  右侧按钮 代理event
 */
@objc
public protocol YoNavBarViewDelegate {
    /// 必须执行
    func leftBtnActionEvent(_ sender: UIButton)
    /// 选择执行
    @objc optional func rightBtnActionEvent(_ sender: UIButton)
}

open class YoNavBarView: UIView {
    open weak var delegate:YoNavBarViewDelegate?
    //左侧按钮
    open lazy var leftBtn: UIButton = {
        let btn = UIButton.init()
        btn.addTarget(self, action: #selector(leftBtnAction(_:)), for: .touchUpInside)
        self.addSubview(btn)
        return btn
    }()
    //中间title
    open lazy var titleLab: UILabel = {
        let lab = UILabel.init()
        self.addSubview(lab)
        return lab
    }()
    //右侧按钮
    open lazy var rightBtn: UIButton = {
        let btn = UIButton.init()
        self.addSubview(btn)
        btn.addTarget(self, action: #selector(rightBtnAction(_:)), for: .touchUpInside)
        return btn
    }()
    //底部分割线
    open lazy var bottomLineView: UIView = {
        let view = UIView.init()
        self.addSubview(view)
        return view
    }()
    public  override init(frame: CGRect) {
        super.init(frame: frame)
        //需要时候添加
    }
    required  public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   //布局
    open override func layoutSubviews() {
       super.layoutSubviews()
        //外放 用哪个布局哪一个 
   }
    @objc  private  func leftBtnAction(_ sender: UIButton) {
         self.delegate?.leftBtnActionEvent(sender)
    }
    @objc  private  func rightBtnAction(_ sender: UIButton) {
        self.delegate?.rightBtnActionEvent?(sender)
    }
}

extension YoNavBarView {
  
}
