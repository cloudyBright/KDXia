//
//  Tools.swift
//  KYFrameworkDemo
//
//  Created by cloudyBright on 16/1/12.
//  Copyright © 2016年 AG_iOS_Group. All rights reserved.
//

import Foundation
import AdSupport
import UIKit

class YLTools: NSObject {

    //MARK: 获取app version name
    //一般是1.0 这样的形式 也就是 short veriosn string
    class func appVersionName()->String
    {
        let infoDic =  NSBundle.mainBundle().infoDictionary
        return infoDic!["CFBundleShortVersionString"] as! String
    }
    
    //MARK: 获取versionCode
    //在infoplist中为string类型 因为一般做版本判定，在这里转成Int
    class func appVersionCode()->Int
    {
        let infoDic =  NSBundle.mainBundle().infoDictionary
        
        let versionCodeStr = infoDic!["CFBundleVersion"] as! String
        
        return Int(versionCodeStr)!
    }

    
    //MARK: 获取随机数
    //eg 1...6 会取得1~6之间的随机数字，包含1和6
    class func randomInRange(range: Range<Int>) -> Int
    {
        let count = UInt32(range.endIndex - range.startIndex)
        
        return Int(arc4random_uniform(count))+range.startIndex
    }
    
    //MARK: 获取IDFA
    class func IDFAString() -> String
    {
        return ASIdentifierManager.sharedManager().advertisingIdentifier.UUIDString
    }
    
    //MARK: 获取ios版本
    class func sysVersion() -> String
    {
        return  UIDevice.currentDevice().systemVersion
    }
    
    //MARK: 获取Document目录
    class func getDocumentPath() -> String
    {
        let documentPath =  NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
        
        return documentPath
        
    }

    
}






