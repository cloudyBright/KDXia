//
//  RecordView.swift
//  KDXia
//
//  Created by cloudyBright on 16/6/28.
//  Copyright © 2016年 ky. All rights reserved.
//

import UIKit
import SnapKit

class RecordView: UIView {

    //left and right container view
    var _leftContainerV:UIView!
    var _rightContainerV:UIView!
    
    var _iconImgV:UIImageView! //record image view
    
    //record volume views
    var _volumeViews:Array<UIView>!
    
    
    
    convenience init(cframe: CGRect) {
        self.init(frame:cframe)
        
        configSubViews()
    }
    
    func configSubViews() {
        _volumeViews = Array()
        
        
        //background view
        let bgView = UIView()
        self.addSubview(bgView)
        bgView.alpha = 0.8
        bgView.backgroundColor = UIColor.blackColor()
        
        bgView.snp_makeConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        //left and right containerView
        _leftContainerV = UIView()
        self.addSubview(_leftContainerV)
        _leftContainerV.snp_makeConstraints { (make) in
            make.width.equalTo(self).multipliedBy(1.0/3)
            make.height.equalTo(self)
            make.left.top.equalTo(self)
        }
        
        _rightContainerV = UIView()
        self.addSubview(_rightContainerV)
        _rightContainerV.snp_makeConstraints { (make) in
            make.left.equalTo(_leftContainerV.snp_right)
            make.right.equalTo(self)
            make.top.bottom.equalTo(self)
        }
        
        //iconImgV
        _iconImgV = UIImageView()
        _iconImgV.image = UIImage(named: "record")
        _leftContainerV.addSubview(_iconImgV)
        _iconImgV.snp_makeConstraints { (make) in
            make.width.equalTo(_leftContainerV).offset(-10)
            make.center.equalTo(_leftContainerV)
            make.height.equalTo(_leftContainerV).multipliedBy(0.66)
        }
        
        
        //volume container view
        let volumeContainerV = UIView()
        _rightContainerV.addSubview(volumeContainerV)
        
        volumeContainerV.snp_makeConstraints { (make) in
            make.left.equalTo(_leftContainerV.snp_right)
            make.right.equalTo(self)
            make.height.equalTo(_iconImgV)
            make.centerY.equalTo(self)
        }
        
        
        //volume views
        for i in 0 ..< 5  {
            let viewItem = UIView()
            viewItem.backgroundColor = UIColor.greenColor()
            volumeContainerV.addSubview(viewItem)
            let itemWidthRate = (Double(i)+4.0)/10.0
            let itemHeightRate = 1.0/9.0
            viewItem.snp_makeConstraints(closure: { (make) in
                make.width.equalTo(volumeContainerV).multipliedBy(itemWidthRate)
                make.height.equalTo(volumeContainerV).multipliedBy(itemHeightRate)
                make.left.equalTo(volumeContainerV)
                if i==0 {
                    make.bottom.equalTo(volumeContainerV)
                } else {
                    let preItem = _volumeViews[i-1]
                    make.bottom.equalTo(preItem.snp_top).offset(-15)
                }
            })
            
            _volumeViews.append(viewItem)
        }
        
    }
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
