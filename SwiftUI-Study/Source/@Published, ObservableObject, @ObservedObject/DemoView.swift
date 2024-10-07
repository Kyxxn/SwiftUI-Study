//
//  DemoView.swift
//  SwiftUI-Study
//
//  Created by 박효준 on 10/8/24.
//

import SwiftUI

struct Demo1View: View {
    @ObservedObject var userCountData: DemoData
    
    var body: some View {
        VStack {
            Text("Demo1View userCountData userCount * 1 : \(userCountData.userCount * 1)")
             Demo2View(userCountData: userCountData)
        }
    }
}

struct Demo2View: View {
    @ObservedObject var userCountData: DemoData
    
    var body: some View {
        VStack {
            Text("Demo2View userCountData userCount * 2 : \(userCountData.userCount * 2)")
             Demo3View(userCountData: userCountData)
        }
    }
}

struct Demo3View: View {
    @ObservedObject var userCountData: DemoData
    
    var body: some View {
        VStack {
            Text("Demo3View userCountData userCount * 3 : \(userCountData.userCount * 3)")
        }
    }
}
