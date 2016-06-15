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

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        let mainTableView = UITableView();
        
        mainTableView.delegate = self;
        mainTableView.dataSource = self;
        
        
        self.view.addSubview(mainTableView);
        
        
        mainTableView.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        // Do any additional setup after loading the view.
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewdataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath);
        
        cell.textLabel?.text = "\(indexPath)";
        return cell;
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
