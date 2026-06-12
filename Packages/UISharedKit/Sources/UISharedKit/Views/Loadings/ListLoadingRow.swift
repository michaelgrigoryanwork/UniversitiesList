//
//  ListLoadingRow.swift
//  UISharedKit
//
//  Created by Michael Grigoryan on 11.06.26.
//

import SwiftUI

public struct ListLoadingRow: View {
    public init() { }
    
    public var body: some View {
        HStack {
            Spacer()
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .indigo))
                .padding(12)
                .background(Color(UIColor.systemBackground))
                .clipShape(Circle())
                .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
            
            Spacer()
        }
        .padding(.vertical, 12)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}
