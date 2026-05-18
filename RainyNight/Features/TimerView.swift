//
//  TimerView.swift
//  RainyNight
//
//  Created by EMILY on 13/05/2026.
//

import SwiftUI

struct TimerView: View {
    
    #if os(iOS)
    @State private var deviceOrientation = UIDevice.current.orientation
    #endif
    
    var body: some View {
        Group {
            Text("Main Timer View")
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            AdaptiveBackgroundImage(orientation: deviceOrientation)
        }
        #if os(iOS)
        .onAppear {
            UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        }
        .onDisappear {
            UIDevice.current.endGeneratingDeviceOrientationNotifications()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            let newOrientation = UIDevice.current.orientation
            if newOrientation.isValidInterfaceOrientation {
                deviceOrientation = newOrientation
                if newOrientation == .portraitUpsideDown {
                    forcePortrait()
                }
            }
        }
        #endif
    }
    
    #if os(iOS)
    private func forcePortrait() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
    }
    #endif
}

#Preview {
    TimerView()
}
