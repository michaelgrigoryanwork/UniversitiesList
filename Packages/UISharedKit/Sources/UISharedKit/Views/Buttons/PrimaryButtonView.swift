//
//  PrimaryButtonView.swift
//  UISharedKit
//
//  Created by Michael Grigoryan on 11.06.26.
//

import SwiftUI

public struct PrimaryButtonView: View {
    public let title: String
    public let iconName: String?
    public let backgroundColor: Color
    public let action: () -> Void
    
    public init(
        title: String,
        iconName: String? = nil,
        backgroundColor: Color = .blue,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.iconName = iconName
        self.backgroundColor = backgroundColor
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                Text(title)
                    .font(.headline)
                
                if let iconName = iconName {
                    Image(systemName: iconName)
                }
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(color: backgroundColor.opacity(0.3), radius: 8, x: 0, y: 4)
        }
    }
}
