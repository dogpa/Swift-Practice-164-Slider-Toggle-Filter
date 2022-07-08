//
//  Model.swift
//  Swift Practice 164 Slider Toggle Filter
//
//  Created by Dogpa's MBAir M1 on 2022/7/6.
//

import Foundation

struct People : Hashable, Identifiable {
    let id = UUID()
    var name: String    //姓名
    var age: Int        //年紀
    var height: Int     //身高
    var outdoor: Bool   //是否喜歡戶外
    var sea: Bool       //是否喜歡海洋
    var mountain: Bool  //是否喜歡登山
}

///隨機產生Ture or False
/// - Returns: 回傳Ture或是False
func checkTureFalse ()-> Bool {
    let index = Int.random(in: 0...1)
    var bool = false
    if index == 0 {
        bool = true
    }
    return bool
}

///透過傳入的Bool值回傳指定的字串
/// - Parameters:
///  - bool: True or False
/// - Returns:回傳是或否
func returnYesOrNo(bool:Bool) -> String {
    var yesOrNo = ""
    if bool == true {
        yesOrNo = "是"
    }else{
        yesOrNo = "否"
    }
    return yesOrNo
}
