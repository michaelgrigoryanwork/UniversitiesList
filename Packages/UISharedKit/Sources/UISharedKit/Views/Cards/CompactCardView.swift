//
//  CompactCardView.swift
//  UISharedKit
//
//  Created by Michael Grigoryan on 11.06.26.
//

import SwiftUI

public struct CompactCardView: View {
    public let title: String
    public let subtitle: String?
    public let url: URL?
    public let iconName: String
    public let iconColor: Color
    public let showDisclosure: Bool
    
    @Environment(\.openURL) private var openURL
    
    public init(
        title: String,
        subtitle: String? = nil,
        url: URL? = nil,
        iconName: String = "building.columns.fill",
        iconColor: Color = .indigo,
        showDisclosure: Bool = false
    ) {
        self.title = title
        self.subtitle = subtitle
        self.url = url
        self.iconName = iconName
        self.iconColor = iconColor
        self.showDisclosure = showDisclosure
    }
    
    public var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            HStack(alignment: .top, spacing: 16) {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(iconColor)
                    .padding(16)
                    .background(iconColor.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.leading)
                    
                    if let subtitle = subtitle, !subtitle.isEmpty {
                        HStack(spacing: 4) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.secondary)
                            
                            Text(subtitle)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    
                    if let url = url {
                        Button(action: {
                            openURL(url)
                        }) {
                            HStack(spacing: 4) {
                                Image(systemName: "link")
                                Text(url.host ?? url.absoluteString)
                                    .font(.caption)
                                    .lineLimit(1)
                            }
                            .foregroundColor(.blue)
                            .padding(.top, 2)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
            }
            
            Spacer(minLength: 0)
            
            if showDisclosure {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color(UIColor.tertiaryLabel))
            }
        }
        .padding(16)
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
    }
}
