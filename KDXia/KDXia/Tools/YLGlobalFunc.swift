//
//  GlobalFunc.swift
//  KYFrameworkDemo
//
//  Created by cloudyBright on 16/1/7.
//  Copyright © 2016年 AG_iOS_Group. All rights reserved.
//

import Foundation

/**
 读取本地化字符串的快捷方法
 
 - parameter key: 字义在Localizable.strings中的 字符串key
 
 - returns: 返回 key 对应的字符串，没找到则返回key
 */
func YL_LS(key:String) -> String
{
    return NSLocalizedString(key, comment: "")
}

/**
 打印日志方法，会输出文件名，行数，和方法名
 
 - parameter message:  打印的信息，可以是任何类型
 - parameter logError: bool类型，默认为false，如果为true,则不论Debug还是relse下都会输出log,一般用来打印错误
 */
func printLog<T>(
    message:T,
    logError:Bool=false,
    file:String=#file,
    method:String=#function,
    line:Int=#line)
{
        if logError{
            print("|error|:\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
        }else{
            #if DEBUG
                print("*************** \((file as NSString).lastPathComponent)[\(line)], \(method):***************\n \(message)\n")
            #endif
        }
}

/**
 采用延迟计算打印日志的方法，会输出文件名，行数，和方法名，message采用延迟计算，如果message信息需要计算而非直接从变量获取，推荐采用此方法
 
 - parameter message:  打印到控制台的信息
 - parameter logError: 是否记录Error(默认为false，记录附加信息)
 - parameter file:     文件信息，默认为__FILE__
 - parameter method:   方法信息，默认为__FUNCTION__
 - parameter line:     所在行行号，默认为__LINE__
 */
func printLogLazyExec<T>(
    @autoclosure message:()->T,
    logError:Bool=false,
    file:String=#file,
    method:String=#function,
    line:Int=#line)
{
    if logError{
        print("|error|:\((file as NSString).lastPathComponent)[\(line)], \(method): \(message())")
    }else{
        #if DEBUG
            print("*************** \((file as NSString).lastPathComponent)[\(line)], \(method):***************\n \(message())\n")
        #endif
    }
}













