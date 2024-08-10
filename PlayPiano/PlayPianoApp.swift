//
//  PlayPianoApp.swift
//  PlayPiano
//
//  Created by blue ken on 2024/08/10.
//

import SwiftUI

@main
struct PlayPianoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .defaultSize(CGSize(width: 3000, height: 500))
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
