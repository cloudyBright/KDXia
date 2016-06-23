//
//  MainVC.swift
//  KDXia
//
//  Created by 阴亮 on 16/6/7.
//  Copyright © 2016年 ky. All rights reserved.
//
import Foundation
import UIKit

class MainVC: UIViewController {

    //MARK: - properties
    var _leftBtn:UIButton?
    var _rightBtn:UIButton?
    var _centerContainerView:UIView?
    
    
    //MARK: - func
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }

    func createSubviews() {
        _leftBtn = UIButton();
        _rightBtn = UIButton();
        
        
        
        
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
