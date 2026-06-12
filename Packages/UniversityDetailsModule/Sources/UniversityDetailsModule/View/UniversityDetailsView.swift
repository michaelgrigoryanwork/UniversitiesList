//
//  UniversityDetailsView.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import SwiftUI
import UISharedKit

public struct UniversityDetailsView: View {
    @Environment(\.openURL) private var openURL
    @ObservedObject private var presenter: UniversityDetailsPresenter
    
    public init(presenter: UniversityDetailsPresenter) {
        self.presenter = presenter
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ZStack {
                    LinearGradient(
                        colors: [.indigo.opacity(0.6), .purple.opacity(0.6)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    
                    Image(systemName: "building.columns.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .foregroundColor(.white)
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
                }
                .frame(height: 220)
                .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                .shadow(color: .indigo.opacity(0.2), radius: 15, x: 0, y: 8)
                .padding(.horizontal)
                .padding(.top, 16)
                
                if let university = presenter.university {
                    Text(university.name)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.primary)
                        .padding(.horizontal)
                    
                    VStack(spacing: 0) {
                        CompactDetailRow(
                            icon: "globe.americas.fill",
                            title: "Country",
                            value: university.country.displayName
                        )
                        
                        Divider()
                            .padding(.leading, 56)
                        
                        CompactDetailRow(
                            icon: "mappin.circle.fill",
                            title: "State / Province",
                            value: university.stateProvince
                        )
                    }
                    .background(Color(UIColor.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 4)
                    .padding(.horizontal)
                    
                    if let url = university.websiteURL {
                        PrimaryButtonView(title: "Visit Official Website", iconName: "arrow.up.right.square") {
                            openURL(url)
                        }
                        .padding(.horizontal)
                        .padding(.top, 10)
                    }
                    
                }
                
                Spacer(minLength: 40)
            }
        }
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            presenter.viewDidLoad()
        }
    }
}
