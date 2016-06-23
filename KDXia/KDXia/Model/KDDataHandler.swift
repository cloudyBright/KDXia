//
//  KDDataHandler.swift
//  KDXia
//
//  Created by cloudyBright on 16/6/23.
//  Copyright © 2016年 ky. All rights reserved.
//

import UIKit

class KDDataHandler: NSObject {
    
    static let sharedInstance = KDDataHandler()
    
    var _allData:Array<CardModel>?
    
    private override init() {
        _allData = Array()
        super.init()
        toInitAllData()
    }
    
    private func toInitAllData() {
        
        for i in 0 ..< 3 {
            
            var tmpImageName = ""
            var tmpText = ""
            switch i {
            case 0:
                tmpImageName = "rabbit"
                tmpText = "兔子"
            case 1:
                tmpImageName = "cat"
                tmpText = "猫"
            case 2:
                tmpImageName = "dog"
                tmpText = "狗"
            default:
                tmpImageName = ""
            }
            
            let cardItem = CardModel(text: tmpText, imgName: tmpImageName)
            _allData?.append(cardItem)
            
        }
        
    }
}
