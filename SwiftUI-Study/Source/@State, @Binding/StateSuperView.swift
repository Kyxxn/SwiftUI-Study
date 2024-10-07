//
//  MainView.swift
//  SwiftUI-Study
//
//  Created by 박효준 on 10/8/24.
//

import SwiftUI

struct StateSuperView: View {
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


