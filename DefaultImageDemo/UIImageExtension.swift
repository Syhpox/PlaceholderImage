//
//  UIImageExtension.swift
//  DefaultImageDemo
//
//  Created by WZH on 2017/7/21.
//  Copyright © 2017年 Zhihua. All rights reserved.
//

import UIKit

extension UIImage {

    
    /// 生成与imgView的size一致的占位加载图 加载图位置和大小自适应 居中 大小取宽高的较小值的3/5
    class func fc_placeholder(_ size: CGSize) -> UIImage? {
        let backgroundColor = UIColor.init(white: 0.9, alpha: 1.0)
        let placeholder = UIImage.fc_defaultImg(min(size.width, size.height) / 5 * 3, backgroundColor: backgroundColor)
        UIGraphicsBeginImageContext(size)
        if let ctx = UIGraphicsGetCurrentContext() {
            ctx.setFillColor(backgroundColor.cgColor)
            ctx.fill(CGRect(origin: CGPoint.zero, size: size))
            
            let placeholderRect = CGRect(x: (size.width - (placeholder?.size.width)!) / 2.0,y: (size.height - (placeholder?.size.height)!) / 2.0,width: (placeholder?.size.width)!,height: (placeholder?.size.height)!)
            ctx.draw((placeholder?.cgImage)!, in: placeholderRect, byTiling: false)
        }
        
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            // 镜像翻转
            let aResult = UIImage(cgImage: image.cgImage!, scale: 1.0, orientation: UIImageOrientation.downMirrored)
            
            return aResult
        }
        UIGraphicsEndImageContext()
        return nil
    }
    
    /// fc_placeholer的中央主要图
    class func fc_defaultImg(_ height: CGFloat, backgroundColor: UIColor = .gray) -> UIImage? {
        let defaultColor = UIColor.init(red: 195 / 255.0, green: 195 / 255.0, blue: 195 / 255.0, alpha: 1.0)
        // 宽高比w / h = 7 / 5.6
        let size = CGSize(width: CGFloat(7 / 5.8) * height, height: height)
        UIGraphicsBeginImageContext(size)
        
        if let ctx = UIGraphicsGetCurrentContext() {
            ctx.setFillColor(backgroundColor.cgColor)
            ctx.fill(CGRect(origin: CGPoint.zero, size: size))
            // 测试使用
            //            ctx.setStrokeColor(UIColor.red.cgColor)
            //            ctx.addRect(CGRect(origin: CGPoint.zero, size: size))
            //            ctx.strokePath()
            
            ctx.move(to: CGPoint(x: 0, y: height))
            ctx.addLine(to: CGPoint(x: 0, y: 3 / 5 * height))
            ctx.addLine(to: CGPoint(x:  1 / 5 * size.width, y: 2 / 5 * height))
            ctx.addLine(to: CGPoint(x: 4 / 7 * size.width, y: 3 / 4 * height))
            ctx.addLine(to: CGPoint(x: 5.6 / 7 * size.width, y: 1 / 2 * height))
            ctx.addLine(to: CGPoint(x: size.width, y: 4 / 5 * height))
            ctx.addLine(to: CGPoint(x: size.width, y: height))
            
            ctx.closePath()
            ctx.setFillColor(defaultColor.cgColor)
            ctx.fillPath()
            
            let radius = 2 / 7 * size.width / 2.0
            ctx.addArc(center: CGPoint(x: (7 - 1.3) / 7 * size.width, y: radius), radius: radius, startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
            
            ctx.setFillColor(defaultColor.cgColor)
            ctx.fillPath()
        }
        
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()
            return image
        }
        
        UIGraphicsEndImageContext()
        return nil
    }
    /*
    /// 老版本使用
    /// 请求图片时的站位图 size与imageView大小一致  size:(width,height)
    class func fc_placeholder(_ imageStr: String = "placeholder", size: (
        CGFloat, CGFloat), backgroundColor: UIColor = UIColor.init(0xf0f0f0)) -> UIImage {
        let size = CGSize(width: size.0, height: size.1)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(size)
        let context = UIGraphicsGetCurrentContext()!
        context.setFillColor(backgroundColor.cgColor)
        context.fill(rect)
        
        let imageDeal = UIImage(named: imageStr)!
        //        let imageScale = imageDeal.size.width / imageDeal.size.height
        let imageHeight: CGFloat = imageDeal.size.height
        let imageWidth: CGFloat = imageDeal.size.width
        // 图片等比缩放
        // 宽 >= 高 横着长方形+正方形 高
        //        if size.width > size.height {
        //            imageHeight = size.height * 1 / 3
        //            imageWidth = imageHeight * imageScale
        //        } else {
        //            // 宽 < 高 竖着长方形 宽
        //            imageWidth = size.width * 1 / 3
        //            imageHeight = imageWidth / imageScale
        //        }
        //        // 若imageWidth imageHeight 大于 原始尺寸  使用原始尺寸
        //        imageWidth = imageWidth > imageDeal.size.width ?  imageDeal.size.width : imageWidth
        //        imageHeight = imageHeight > imageDeal.size.height ?  imageDeal.size.height : imageHeight
        
        let imagePoint = CGPoint(x: (size.width - imageWidth) / 2, y: (size.height - imageHeight) / 2)
        let imageRect = CGRect(origin: imagePoint, size: CGSize(width: imageWidth, height: imageHeight))
        
        context.draw(imageDeal.cgImage!, in: imageRect)
        
        //        print("_\(imageHeight)___\(imageWidth)__\(imagePoint)__\(imageRect)_")
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        // 由于裁剪时 显示图片镜面反向 so 反向一次
        let aResult = UIImage(cgImage: result!.cgImage!, scale: 1.0, orientation: UIImageOrientation.downMirrored)
        UIGraphicsEndImageContext()
        
        return aResult
    }
*/

    
}
