//
//  CarModel.swift
//  KDXia
//
//  Created by cloudyBright on 16/6/23.
//  Copyright © 2016年 ky. All rights reserved.
//

import UIKit

class CardModel: NSObject {
    var _cid:String?
    var _text:String?
    var _imgName:String?
    var _soundPPath:String?  //Pepole Path 人声描述
    var _soundAPath:String? //actual path 实际声音，像猫或狗的叫声，这个暂时只能在程序录入
    
    init(text:String = "无题", imgName:String) {
        _text = text
        _imgName = imgName
        super.init()
    }
    
    
}
