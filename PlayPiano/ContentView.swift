//
//  ContentView.swift
//  PlayPiano
//
//  Created by blue ken on 2024/08/10.
//

import SwiftUI
import RealityKit
import RealityKitContent
import PianoKeyboard

struct ContentView: View {
    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @ObservedObject private var pianoKeyboardViewModel: PianoKeyboardViewModel
    private let audioEngine: AudioEngine
    
    init(
        pianoKeyboardViewModel: PianoKeyboardViewModel = PianoKeyboardViewModel(),
        audioEngine: AudioEngine = AudioEngine(soundFontFile: "soundfont")
    ) {
        self.pianoKeyboardViewModel = pianoKeyboardViewModel
        self.audioEngine = audioEngine
        
        pianoKeyboardViewModel.showLabels = true
        pianoKeyboardViewModel.numberOfKeys = 84
        pianoKeyboardViewModel.noteOffset = 24
    }
    var body: some View {
        VStack {
            PianoKeyboardView(viewModel: pianoKeyboardViewModel, style: ClassicStyle(sfKeyWidthMultiplier: 0.55))
                .frame(height: 400)
            Toggle("Show ImmersiveSpace", isOn: $showImmersiveSpace)
                .font(.title)
                .frame(width: 360)
                .padding(24)
                .glassBackgroundEffect()
        }
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
        .onAppear() {
            pianoKeyboardViewModel.delegate = audioEngine
            audioEngine.start()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
