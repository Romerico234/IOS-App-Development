//
//  PicNixApp.swift
//  PicNix
//
//  Created by Romerico David on 10/21/24.
//

import SwiftUI

@main
struct PicNixApp: App {
    var body: some Scene {
        WindowGroup {
            PostListView()
                .preferredColorScheme(.dark) 
        }
    }
}
