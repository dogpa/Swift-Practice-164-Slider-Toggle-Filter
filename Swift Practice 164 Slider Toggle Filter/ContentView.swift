//
//  ContentView.swift
//  Swift Practice 164 Slider Toggle Filter
//
//  Created by Dogpa's MBAir M1 on 2022/7/6.
//

import SwiftUI

struct ContentView: View {
    
    //取得FilterViewModel()指派給vm
    @ObservedObject var vm = FilterViewModel()
    
    var body: some View {
        GeometryReader { geo in
            VStack{
                HStack{
                    Text("年紀")
                    Text("目前最小年齡：\(vm.age.formatted(.number.precision(.fractionLength(0)))) 歲")
                }
                //過濾年齡的slider
                Slider(value: $vm.age, in: 18...100, step: 1)
                    .padding()
                HStack{
                    Text("身高")
                    Text("目前最小身高：\(vm.height.formatted(.number.precision(.fractionLength(0)))) cm")
                }
                
                //過濾身高的slider
                Slider(value: $vm.height, in: 100...200, step: 1)
                    .padding()
                
                //過濾是否喜歡戶外、海洋、登山的Toggle
                HStack {
                    Toggle("喜歡戶外", isOn: $vm.outdoorLike).padding()
                    Toggle("喜歡海洋", isOn: $vm.seaLike).padding()
                    Toggle("喜歡登山", isOn: $vm.mountainLike).padding()
                }
                
                //顯示人的清單
                ScrollView {
                    Divider()
                    ForEach(0..<$vm.filterPeopleList.count, id: \.self) { peo in
                        Text("\(vm.filterPeopleList[peo].name)")
                        Text("\(vm.filterPeopleList[peo].age) 歲")
                        Text("\(vm.filterPeopleList[peo].height) cm")
                        HStack{
                            Text("戶外: \(returnYesOrNo(bool:vm.filterPeopleList[peo].outdoor))")
                            Text("海洋: \(returnYesOrNo(bool:vm.filterPeopleList[peo].sea))")
                            Text("登山: \(returnYesOrNo(bool:vm.filterPeopleList[peo].mountain))")
                            Text("")
                        }
                        Divider()
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
            }
        }
        //顯示值產生隨機的清單
        .onAppear {
            vm.createRandomPeopleList()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
