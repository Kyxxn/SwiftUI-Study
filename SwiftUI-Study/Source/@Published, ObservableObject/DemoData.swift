//
//  DataWithPublished.swift
//  SwiftUI-Study
//
//  Created by 박효준 on 10/8/24.
//

import SwiftUI

final class DemoData: ObservableObject {
    @Published var userCount: Int = 0
    
    init() {
        initUserCount()
    }
    
    func initUserCount() {
        userCount = 0
    }
}
