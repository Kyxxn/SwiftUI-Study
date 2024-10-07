//
//  EnvironmentObjectSuperView.swift
//  SwiftUI-Study
//
//  Created by 박효준 on 10/8/24.
//

import SwiftUI

struct EnvironmentObjectSuperView: View {
    @EnvironmentObject var demoData: DemoData
    
    var body: some View {
        NavigationView { // NavigationView 추가
            VStack {
                Text("Current Count: \(demoData.userCount)")
                Button("Increase Count") {
                    demoData.userCount += 1
                }
                NavigationLink(destination: SecondView()) {
                    Text("Go to Second View")
                }
            }
            .padding()
        }
    }
}

struct SecondView: View {
    @EnvironmentObject var demoData: DemoData
    
    var body: some View {
        VStack {
            Text("User Count in Second View: \(demoData.userCount)")
            Button("Increase Count") {
                demoData.userCount += 1
            }
        }
        .padding()
    }
}
