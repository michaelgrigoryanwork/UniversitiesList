//
//  ErrorView.swift
//  UISharedKit
//
//  Created by Michael Grigoryan on 11.06.26.
//

import SwiftUI

public struct ErrorView: View {
    public let message: String
    public let retryAction: () -> Void
    
    public init(
        message: String,
        retryAction: @escaping () -> Void
    ) {
        self.message = message
        self.retryAction = retryAction
    }
    
    public var body: some View {
        VStack(spacing: 24) {
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.red)
                .padding(20)
                .background(Color.red.opacity(0.1))
                .clipShape(Circle())
            
            VStack(spacing: 8) {
                Text("Something went wrong")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.primary)
                
                Text(message)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 16)
            
            PrimaryButtonView(
                title: "Try Again",
                iconName: "arrow.clockwise",
                backgroundColor: .blue,
                action: retryAction
            )
            .padding(.top, 8)
        }
        .padding(24)
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
        .shadow(color: Color.black.opacity(0.05), radius: 12, x: 0, y: 6)
        .padding(.horizontal, 24)
    }
}
