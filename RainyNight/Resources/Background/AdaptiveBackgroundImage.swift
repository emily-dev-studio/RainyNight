//
//  AdaptiveBackgroundImage.swift
//  RainyNight
//
//  Created by EMILY on 13/05/2026.
//

import SwiftUI

struct AdaptiveBackgroundImage: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    #if os(iOS)
    @State private var orientation = UIDevice.current.orientation
    #endif
    
    var body: some View {
        Group {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
        #if os(iOS)
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            let newOrientation = UIDevice.current.orientation
            if newOrientation.isValidInterfaceOrientation {
                orientation = newOrientation
            }
        }
        #endif
    }
    
    var imageName: String {
        // mac
        #if os(macOS)
        return "background-macos"
        
        #else
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            // iPad
            switch orientation {
            case .portrait, .portraitUpsideDown:
                return "background-portrait"
            case .landscapeLeft, .landscapeRight:
                return "background-ipad-landscape"
            default:
                return "background-portrait"
            }
        default:
            // iPhone
            switch orientation {
            case .portrait, .portraitUpsideDown:
                return "background-portrait"
            case .landscapeLeft, .landscapeRight:
                return "background-macos"
            default:
                return "background-portrait"
            }
        }
        #endif
    }
}

#Preview {
    AdaptiveBackgroundImage()
}
