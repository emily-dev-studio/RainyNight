//
//  TimerView.swift
//  RainyNight
//
//  Created by EMILY on 13/05/2026.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        Group {
            Text("Main Timer View")
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            AdaptiveBackgroundImage()
        }
    }
}

#Preview {
    TimerView()
}
