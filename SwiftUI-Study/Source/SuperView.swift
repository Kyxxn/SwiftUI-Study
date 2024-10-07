//
//  MainView.swift
//  SwiftUI-Study
//
//  Created by 박효준 on 10/8/24.
//

import SwiftUI

/*
 내가 이해한 @State와 @Binding
 @State 프로퍼티는 뷰 내부에서 관리되는 상태로 등록됨
    해당 프로퍼티가 변경되면 해당 변수를 사용하는 뷰는 자동으로 다시 렌더링 됨
 
 @Binding 프로퍼티는 부모 뷰에서 전달해주는 상태에 대한 참조임
    생성자를 통해서 받는 개념이 아니라 부모가 $로 참조를 전달함
    바인딩하고 있는 프로퍼티가 변경되면 자식 뷰도 동일한 상태로 변경 감지 -> 뷰를 다시 그림

 @State로 등록한 프로퍼티가 변경되면, 해당 상태와 바인딩된 자식 뷰 모두 다 업데이트 됨
 */

struct SuperView: View {
    @State private var wifiEnabled = true
    @State private var userName = ""
    
    var body: some View {
        VStack {
            Toggle(isOn: $wifiEnabled) {
                Text("Enable Wi-fi")
            }.padding()
            TextField("Enter user name", text: $userName).padding()
            if userName.isEmpty {
                Text("이름을 입력해주세요.")
            } else {
                Text(userName)
            }
            WifiImageView(wifiEnabled: $wifiEnabled)
        }.border(Color.black, width: 1.5).padding()
    }
}

struct WifiImageView: View {
    @Binding var wifiEnabled: Bool
    
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi": "wifi.slash")
            .resizable()
            .frame(width: 50, height: 40, alignment: .center)
            .padding()
    }
}
