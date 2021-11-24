//
//  YoDefine.swift
//  YoNavBarView
//
//  Created by admin on 2021/11/17.
//

import Foundation
import UIKit
//MARK:- Swift 中没有宏定义，苹果建议使用let 或者 get 属性来替代宏定义值。虽然没有#define，但我们仍然可以使用 #if 并配合编译的配置来完成条件编译。下面会列出Swift项目开发中的一些常用宏定义，并提供源码。
import Foundation
import UIKit

// MARK: - 常用宽高
/// 屏幕Bounds
public let kScreenBounds = UIScreen.main.bounds;
/// 屏幕高度
public let kScreenHeight = UIScreen.main.bounds.size.height;
/// 屏幕宽度
public let kScreenWidth = UIScreen.main.bounds.size.width;
/// 导航栏高度
public let kNavBarHeight = 44.0;
/// 状态栏高度
public let kStatusBarHeight = 20.0;
/// Tab栏高度
public let kTabBarHeight = 49.0;

/* 判断是否是带刘海 */
public func kIsIphoneX() -> Bool {
   if #available(iOS 11.0, *) {
       let window = UIApplication.shared.delegate?.window
       guard (window != nil) else { return false }
       let heigth: CGFloat = window!!.safeAreaInsets.bottom
       if heigth > 0 {
           return true
       }
   }
   return false
}

// 是否是iPad
//public let GK_IS_IPAD: Bool = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)
public  let kIsIpad: Bool = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)

//MARK:- 常用字体宏定义

/*!
 字体
*/
//字体-系统-普通
public func YoSystemFont(_ size: CGFloat) -> UIFont {
   return UIFont.systemFont(ofSize: size)
}
//字体-系统-加粗
//func YoBoldSystemSystemFont(_ size: CGFloat) -> UIFont {
//   return UIFont.boldSystemFont(ofSize: size)
//}
////自定义字体
//func YoFont(_ size: CGFloat, name: String!) -> UIFont {
//    return UIFont(name: name, size: size)!
//}
///*
// 字号
// 独立出来缩放 configure 设置sale 系数
// */
//
///// 仅用于标题栏上，大标题字号
//let kNavFontSize = 20;
///// 标题字号
//let kTitleFontSize = 18;
///// 正文字号
//let kBodyFontSize = 16;
///// 辅助字号
//let kAssistFontSize = 14;

//MARK:- 常用变量/方法定义
/**
 打印日志
 
 - parameter message: 日志消息内容
 */
public func printLog<T>(message: T){
    #if DEBUG
        print(" \(message)");
    #endif
}
