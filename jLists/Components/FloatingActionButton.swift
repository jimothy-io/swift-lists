//
//  FloatingActionButton.swift
//  jLists
//
//  Created by j on 05/03/2026.
//

import SwiftUI

struct FloatingActionButton: View {
    let action: () -> Void
    let icon: String

    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: 28, weight: .bold))
                .foregroundStyle(.white)
                .frame(width: 56, height: 56)
                .background(Color.accentColor)
                .clipShape(Circle())
                .shadow(radius: 8)
        }
    }
}

#Preview {
    FloatingActionButton(action: {}, icon: "plus")
}
