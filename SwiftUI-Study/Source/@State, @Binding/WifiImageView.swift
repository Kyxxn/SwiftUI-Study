//
//  WifiImageView.swift
//  SwiftUI-Study
//
//  Created by 박효준 on 10/8/24.
//

import SwiftUI

struct WifiImageView: View {
    @Binding var wifiEnabled: Bool
    
    var body: some View {
        Image(systemName: wifiEnabled ? "wifi": "wifi.slash")
            .resizable()
            .frame(width: 50, height: 40, alignment: .center)
            .padding()
    }
}
