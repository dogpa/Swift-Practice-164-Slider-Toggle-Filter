//
//  FilterViewModel.swift
//  Swift Practice 164 Slider Toggle Filter
//
//  Created by Dogpa's MBAir M1 on 2022/7/6.
//

import Foundation

final class FilterViewModel : ObservableObject {
    
    
    //接收透過自定義Function createRandomPeopleList的隨機人物
    @Published var originalPeopleList: [People] = []
    
    //接收依照指定條件過濾後的隨機人物清單
    @Published var filterPeopleList: [People] = []
    
    //年紀，若有更動執行自定義的filterList Function
    @Published var age: Float = 18 {
        didSet {
            filterList()
        }
    }
    
    //身高，若有更動執行自定義的filterList Function
    @Published var height: Float = 100 {
        didSet {
            filterList()
        }
    }
    
    //是否喜歡戶外，若有更動執行自定義的filterList Function
    @Published var outdoorLike = false {
        didSet {
            filterList()
        }
    }
    
    //是否喜歡海，若有更動執行自定義的filterList Function
    @Published var seaLike = false {
        didSet {
            filterList()
        }
    }
    
    //是否喜歡登山，若有更動執行自定義的filterList Function
    @Published var mountainLike = false {
        didSet {
            filterList()
        }
    }
    
    ///隨機建立500-1000人的資料
    ///姓名、年齡、身高、是否喜歡戶外、是否喜歡海洋、是否喜歡登山透過隨機方式產生
    ///產生後將隨機Array指派給originalPeopleList
    func createRandomPeopleList () {
        for _ in 0...Int.random(in: 500...1000) {
            originalPeopleList.append(
                People(name: "隨機\(Int.random(in: 0...999))\(Int.random(in: 0...999))",
                       age: Int.random(in: 18...99),
                       height: Int.random(in: 100...200),
                       outdoor: checkTureFalse(),
                       sea: checkTureFalse(),
                       mountain: checkTureFalse()))
        }
        filterPeopleList = originalPeopleList
    }
    
    ///依序對於不同的條件進行過濾
    func filterList () {
        //年紀
        let filterAgeList = originalPeopleList.filter {$0.age > Int(age)}
        filterPeopleList = filterAgeList
        
        //身高
        let filterHeightList = filterAgeList.filter { $0.height > Int(height)}
        filterPeopleList = filterHeightList
       
        //喜歡戶外?
        if outdoorLike {
            let filterOutdoorList = filterPeopleList.filter {$0.outdoor == true}
            filterPeopleList = filterOutdoorList
        }
        
        //喜歡海洋?
        if seaLike {
            let seaList = filterPeopleList.filter {$0.sea == true}
            filterPeopleList = seaList
        }
        
        //喜歡登山?
        if mountainLike {
            let mountainList = filterPeopleList.filter {$0.mountain == true}
            filterPeopleList = mountainList
        }
    }
}
