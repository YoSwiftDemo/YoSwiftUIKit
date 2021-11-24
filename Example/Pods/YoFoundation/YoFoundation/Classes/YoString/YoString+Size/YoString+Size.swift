//
//  NSString+YoExpand.swift
//  RxSwiftKing
//
//  Created by admin on 2021/10/21.
//

import Foundation
//MARK: 计算字符串宽度或者高度
// 计算字符串尺寸大小
extension String {
    /// 根据字符串计算高度尺寸，width 默认是最大数
    func size(font: UIFont, width: CGFloat = CGFloat.greatestFiniteMagnitude, paragraphStyle: NSParagraphStyle = NSParagraphStyle.default) -> CGSize {
        var attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font : font]
        attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        let rect = self.boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude),
                                     options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                     attributes: attributes,
                                     context: nil)
        return rect.size
    }

    /// 根据字符串计算宽度尺寸
    func getSizeWithHeight(font: UIFont, height: CGFloat = CGFloat.greatestFiniteMagnitude, paragraphStyle: NSParagraphStyle = NSParagraphStyle.default) -> CGSize {
        var attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font : font]
        attributes[NSAttributedString.Key.paragraphStyle] = paragraphStyle
        let rect = self.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: height),
                                     options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                     attributes: attributes,
                                     context: nil)
        return rect.size
    }

}

extension String {
    
    /// 计算字符串宽高
    /// - Parameters:
    ///   - font: 字体
    ///   - width: 设定的宽度
    ///   - height: 设定的高度
    ///   - kernSpace: 字符间距
    ///   - lineSpace: 行间距
    /// - Returns: CGSize 值
    public func calculateSize(
        font: UIFont,
        width: CGFloat = CGFloat.greatestFiniteMagnitude,
        height: CGFloat = CGFloat.greatestFiniteMagnitude,
        kernSpace: CGFloat = 0,
        lineSpace: CGFloat = 0
    ) -> CGSize {
        if kernSpace == 0, lineSpace == 0 {
            let rect = self.boundingRect(
                with: CGSize(width: width, height: height),
                options: .usesLineFragmentOrigin,
                attributes: [.font: font],
                context: nil
            )
            return CGSize(width: ceil(rect.width), height: ceil(rect.height))
        }else {
            let rect = CGRect(x: 0, y: 0, width: width, height: height)
            let label = UILabel(frame: rect)
            label.numberOfLines = 0
            label.font = font
            label.text = self
            let style = NSMutableParagraphStyle()
            style.lineSpacing = lineSpace
            let attr = NSMutableAttributedString(
                string: self,
                attributes: [.kern : kernSpace]
            )
            attr.addAttribute(
                .paragraphStyle,
                value: style,
                range: NSMakeRange(0, self.count)
            )
            label.attributedText = attr
            return label.sizeThatFits(rect.size)
        }
    }
}

