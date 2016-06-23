//
//  MainVC.swift
//  KDXia
//
//  Created by 阴亮 on 16/6/7.
//  Copyright © 2016年 ky. All rights reserved.
//
import Foundation
import UIKit
import SnapKit

class MainVC: UIViewController {

    //MARK: - properties
    var _leftBtn:UIButton?
    var _rightBtn:UIButton?
    var _centerContainerView:UIView?
    var _cFuncView:UIView?
    var _cImgView:UIImageView?
    var _cTextLabel:UILabel?
    
    let verMargin = 5
    let horMargin = 10
    
    //MARK: - func
    override func viewDidLoad() {
        super.viewDidLoad()

        createSubviews()
        configSubViews()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    private func configSubViews() {
        
         _leftBtn?.snp_makeConstraints(closure: { (make) in
            make.left.top.bottom.equalTo(view)
            make.width.equalTo(view).multipliedBy(0.1)
        })
        _rightBtn?.snp_makeConstraints(closure: { (make) in
            make.right.top.bottom.equalTo(view)
            make.width.equalTo(_leftBtn!)
        })
        
        _centerContainerView?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(_leftBtn!.snp_right).offset(horMargin)
            make.right.equalTo(_rightBtn!.snp_left).offset(-horMargin)
            make.top.bottom.equalTo(view)
        })
        
        _cFuncView?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(_centerContainerView!).offset(horMargin)
            make.right.equalTo(_centerContainerView!).offset(-horMargin)
            make.top.equalTo(_centerContainerView!).offset(verMargin)
            make.height.equalTo(30)
        })
        
        _cImgView?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(_cFuncView!.snp_bottom).offset(verMargin)
            make.left.equalTo(_centerContainerView!).offset(horMargin)
            make.right.equalTo(_centerContainerView!).offset(-horMargin)
        })
        
        
        _cTextLabel?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(_cImgView!.snp_bottom).offset(verMargin)
            make.bottom.equalTo(_centerContainerView!).offset(-verMargin)
            make.left.equalTo(_centerContainerView!).offset(horMargin)
            make.right.equalTo(_centerContainerView!).offset(-horMargin)
            make.height.equalTo(30)
            
        })
        
    }

    private func createSubviews() {
        //leftBtn
        _leftBtn = UIButton()
        view.addSubview(_leftBtn!)
        _leftBtn?.setTitle("上", forState: .Normal)
        _leftBtn?.backgroundColor = UIColor.cyanColor()
        
       
        //rightBtn
        _rightBtn = UIButton()
        view.addSubview(_rightBtn!)
        _rightBtn?.setTitle("下", forState: .Normal)
        _rightBtn?.backgroundColor = UIColor.cyanColor()
        
        //centerContainerView
        _centerContainerView = UIView()
        view.addSubview(_centerContainerView!)
        _centerContainerView?.backgroundColor = UIColor.grayColor()
       
        //funcView
        _cFuncView = UIView()
        _centerContainerView!.addSubview(_cFuncView!)
        _cFuncView?.backgroundColor = UIColor.yellowColor()
       
        //imageView
        _cImgView = UIImageView()
        _centerContainerView!.addSubview(_cImgView!)
        _cImgView?.backgroundColor = UIColor.cyanColor()
        
        
       //textLabel
        _cTextLabel = UILabel()
        _cTextLabel?.textAlignment = .Center
        _centerContainerView!.addSubview(_cTextLabel!)
        _cTextLabel?.backgroundColor = UIColor.brownColor()
        _cTextLabel?.text = "显示文字"
       
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
