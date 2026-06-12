//
//  CompactDetailRow.swift
//  UISharedKit
//
//  Created by Michael Grigoryan on 11.06.26.
//

import SwiftUI

public struct CompactDetailRow: View {
    public let icon: String
    public let iconColor: Color
    public let title: String
    public let value: String
    
    public init(
        icon: String,
        iconColor: Color = .blue,
        title: String,
        value: String
    ) {
        self.icon = icon
        self.iconColor = iconColor
        self.title = title
        self.value = value
    }
    
    public var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
                .foregroundColor(iconColor)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .textCase(.uppercase)
                
                Text(value)
                    .font(.body)
                    .foregroundColor(.primary)
            }
            Spacer()
        }
        .padding(16)
    }
}
