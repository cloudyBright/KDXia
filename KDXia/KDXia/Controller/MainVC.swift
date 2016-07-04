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
    var _cPlaySoundBtn:UIButton?
    var _cSwitchBtn:UIButton?
    var _cRecordImgV:UIImageView?
    
    var _cBackImgView:UIImageView?
    var _cImgView:UIImageView?
    var _cTextLabel:UILabel?
    
    var _recordingView:UIView?
    
    var _allData:Array<CardModel>?  //所有数据
    
    var _audioHandler:AudioHandler! //录音句柄
    
    var _curIndex = 0 //当前卡片所在索引
    
    let verMargin = 12
    let horMargin = 10
    
    
    //MARK: - func
    override func viewDidLoad() {
        super.viewDidLoad()

        createSubviews()
        configSubViews()
        
        _allData = KDDataHandler.sharedInstance._allData
       
        loadData(_allData![_curIndex])
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func loadData(cardItem:CardModel) {
        
        _cImgView?.image = UIImage(named: cardItem._imgName!)
        _cTextLabel?.text = cardItem._text
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
        
        
        _cPlaySoundBtn?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(_cFuncView!).offset(20)
            make.width.height.equalTo(30)
            make.centerY.equalTo(_cFuncView!)
        })
        
        _cTextLabel?.snp_makeConstraints(closure: { (make) in
            make.center.equalTo(_cFuncView!)
        })
        
        _cRecordImgV?.snp_makeConstraints(closure: { (make) in
            make.right.equalTo(_cFuncView!).offset(-20)
            make.width.height.equalTo(30)
            make.centerY.equalTo(_cFuncView!)
        })
         
        _cBackImgView?.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(_cFuncView!.snp_bottom).offset(2)
            make.bottom.equalTo(_centerContainerView!).offset(-2)
            make.left.right.equalTo(_centerContainerView!)
        })
        
        _cImgView?.snp_makeConstraints(closure: { (make) in
            make.top.left.equalTo(_cBackImgView!).offset(25)
            make.right.bottom.equalTo(_cBackImgView!).offset(-25)
        })
        
        _recordingView?.snp_makeConstraints(closure: { (make) in
            make.center.equalTo(view)
            make.height.equalTo(view).multipliedBy(1.0/2)
            make.width.equalTo(view).multipliedBy(1.0/4)
        })
        
    }

    func goPreCard() {
        print("goPreCard")
        
        if _curIndex <= 0 {
            return
        }
        _curIndex -= 1
        loadData(_allData![_curIndex])
    }
    
    func goNextCard() {
        print("goNextCard")
        
        if _curIndex >= _allData!.count-1 {
            return
        }
        
        _curIndex += 1
        loadData(_allData![_curIndex])
    }
    
    func playSound() {
        
    }
    
    func record(gesture:UILongPressGestureRecognizer) {
        if gesture.state == .Began {
            print("record began....")
            
            _recordingView?.hidden = false
            
            let curItem = _allData![_curIndex]
            _audioHandler = AudioHandler(cid: curItem._cid!)
            
            _audioHandler.startRecord()
            
            
        } else if gesture.state == .Ended {
            print("record end....")
            
            _audioHandler.stopRecord()
            
            _recordingView?.hidden = true
        }
        
    }
    
    private func createSubviews() {
        //leftBtn
        _leftBtn = UIButton()
        _leftBtn?.addTarget(self, action: #selector(MainVC.goPreCard), forControlEvents: .TouchUpInside)
        view.addSubview(_leftBtn!)
        _leftBtn?.setImage(UIImage(named: "preArrow"), forState: .Normal)
       
        //rightBtn
        _rightBtn = UIButton()
        _rightBtn?.addTarget(self, action: #selector(MainVC.goNextCard), forControlEvents: .TouchUpInside)
        view.addSubview(_rightBtn!)
        _rightBtn?.setImage(UIImage(named: "nextArrow"), forState: .Normal)
        //centerContainerView
        _centerContainerView = UIView()
        view.addSubview(_centerContainerView!)
       
        //funcView
        _cFuncView = UIView()
        _centerContainerView!.addSubview(_cFuncView!)
        
        
        //funcView -- playSoundBtn
        _cPlaySoundBtn = UIButton()
        _cPlaySoundBtn!.addTarget(self, action: #selector(MainVC.playSound), forControlEvents: .TouchUpInside)
        _cFuncView?.addSubview(_cPlaySoundBtn!)
        _cPlaySoundBtn!.setImage(UIImage(named: "palySound"), forState: .Normal)
        
        //funcView -- switchBtn
        _cTextLabel = UILabel()
        _cTextLabel?.textAlignment = .Center
        _cFuncView?.addSubview(_cTextLabel!)
        
        //funcView -- recordImageView
        _cRecordImgV = UIImageView()
        _cRecordImgV?.userInteractionEnabled = true
        _cFuncView?.addSubview(_cRecordImgV!)
        _cRecordImgV?.image = UIImage(named: "record")
        let longPressGR = UILongPressGestureRecognizer(target: self, action: #selector(MainVC.record))
        longPressGR.minimumPressDuration = 3.0
        _cRecordImgV?.addGestureRecognizer(longPressGR)
        
        
        //imageBackView
        _cBackImgView = UIImageView()
        _centerContainerView!.addSubview(_cBackImgView!)
        _cBackImgView?.image = UIImage(named: "backImageV")
        
        //imageView
        _cImgView = UIImageView()
        _cImgView?.contentMode = .ScaleAspectFit
        _cBackImgView!.addSubview(_cImgView!)
        
        //recordingView
        _recordingView = RecordView(cframe: CGRect.zero)
        view.addSubview(_recordingView!)
        _recordingView?.hidden = true
        
        
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
