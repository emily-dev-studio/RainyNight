//
//  AdaptiveBackgroundImage.swift
//  RainyNight
//
//  Created by EMILY on 13/05/2026.
//

import SwiftUI

struct AdaptiveBackgroundImage: View {
    
    #if os(iOS)
    let orientation: UIDeviceOrientation  // ✅ State 대신 let
    #endif
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
    
    var imageName: String {
        #if os(macOS)
        return "background-macos"
        #else
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            switch orientation {
            case .portrait, .portraitUpsideDown:
                return "background-portrait"
            case .landscapeLeft, .landscapeRight:
                return "background-ipad-landscape"
            default:
                return "background-portrait"
            }
        default:
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
    AdaptiveBackgroundImage(orientation: .portrait)
}
