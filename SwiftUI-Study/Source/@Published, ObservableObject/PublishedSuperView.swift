//
//  PublishedSuperView.swift
//  SwiftUI-Study
//
//  Created by 박효준 on 10/8/24.
//

import SwiftUI

struct PublishedSuperView: View {
    @ObservedObject var userCountData: DemoData
    
    public var body: some View {
        VStack {
            Demo1View(userCountData: userCountData)
            Button(action: {
                userCountData.userCount += 1
            }) {
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 130, height: 100, alignment: .center)
            }
        }
    }
}
