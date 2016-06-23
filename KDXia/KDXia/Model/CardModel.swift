//
//  CarModel.swift
//  KDXia
//
//  Created by cloudyBright on 16/6/23.
//  Copyright © 2016年 ky. All rights reserved.
//

import UIKit

class CardModel: NSObject {
    var _id:String?
    var _text:String?
    var _imgName:String?
    var _soundPath:String?
    
    
    init(text:String = "无题", imgName:String) {
        _text = text
        _imgName = imgName
        
        super.init()
    }
    
    
    
    
}
