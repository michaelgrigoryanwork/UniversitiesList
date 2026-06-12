//
//  EmptyStateView.swift
//  UISharedKit
//
//  Created by Michael Grigoryan on 11.06.26.
//

import SwiftUI

public struct EmptyStateView: View {
    private let text: String
    
    public init(text: String) {
        self.text = text
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 40, weight: .medium))
                .foregroundColor(.indigo)
                .padding(24)
                .background(Color.indigo.opacity(0.1))
                .clipShape(Circle())
            
            VStack(spacing: 8) {
                Text("No results found")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.primary)
                
                Text("We couldn't find anything for \"\(text)\".\nTry adjusting your search.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(32)
    }
}
