//
//  FullScreenLoadingView.swift
//  UISharedKit
//
//  Created by Michael Grigoryan on 11.06.26.
//

import SwiftUI

public struct FullScreenLoadingView: View {
    public let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        VStack(spacing: 24) {
            ZStack {
                Circle()
                    .fill(Color.indigo.opacity(0.1))
                    .frame(width: 72, height: 72)
                
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
                    .scaleEffect(1.5)
            }
            
            VStack(spacing: 8) {
                Text(text)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                
                Text("Fetching the latest data...")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.horizontal, 16)
        }
        .padding(32)
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: Color.black.opacity(0.05), radius: 12, x: 0, y: 6)
        .padding(.horizontal, 32)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
    }
}
