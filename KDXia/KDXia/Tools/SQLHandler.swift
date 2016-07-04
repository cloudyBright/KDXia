//
//  SQLHandler.swift
//  KDXia
//
//  Created by cloudyBright on 16/7/1.
//  Copyright © 2016年 ky. All rights reserved.
//

import UIKit
import SQLite

class SQLHandler: NSObject {
    
    var _db:Connection! = nil
    
    let _cards = Table("cards")
    let _cid = Expression<Int64>("_cid")
    let _text = Expression<String?>("_text")
    let _imgName = Expression<String?>("_imgName")
    let _soundPPath = Expression<String?>("_soundPPath")
    let _soundAPath = Expression<String?>("_soundAPath")
    
    override init() {
        
        
        let dbPath = "\(YLTools.getDocumentPath())/cardData.db"
        
        do {
          try _db = Connection(dbPath)
        } catch {
            
        }

        super.init()
        
    }
    
    
    func crateTable() {
        guard let tmpDb = _db else {
            return
        }
        
        
//        do {
//            try tmpDb.run(_cards.create {
//                t in
//                t.column(_cid, primaryKey:true)
//                t.column(_text)
//                })
//        } catch {
//            
//        }
        
        do {
//            try tmpDb.run(_cards.create())
        } catch {
            
        }
        
    }
    
    
}
