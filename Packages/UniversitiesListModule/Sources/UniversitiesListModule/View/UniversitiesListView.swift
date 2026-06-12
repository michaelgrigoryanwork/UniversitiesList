//
//  UniversitiesListView.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import SwiftUI
import UISharedKit
import CoreDataKit

public struct UniversitiesListView: View {
    @ObservedObject private var presenter: UniversitiesListPresenter
    
    public init(presenter: UniversitiesListPresenter) {
        self.presenter = presenter
    }
    
    public var body: some View {
        ZStack {
            if presenter.isLoading && presenter.universities.isEmpty {
                FullScreenLoadingView(text: "Loading \(presenter.selectedCountry.displayName)")
            } else if presenter.isShowingError && presenter.universities.isEmpty {
                ErrorView(
                    message: presenter.errorMessage ?? "An unknown error occurred.",
                    retryAction: { presenter.fetchData() }
                )
            } else {
                List {
                    ForEach(presenter.universities) { university in
                        Button(action: {
                            presenter.didSelect(university: university)
                        }) {
                            CompactCardView(
                                title: university.name,
                                subtitle: university.stateProvince,
                                url: university.websiteURL,
                                showDisclosure: true
                            )
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowSeparator(.hidden)
                        .listRowInsets(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                        .listRowBackground(Color.clear)
                        .onAppear {
                            presenter.requestMoreDataIfNeeded(item: university)
                        }
                    }
                    
                    if presenter.isRowLoading {
                        ListLoadingRow()
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.clear)
                    }
                }
                .listStyle(.plain)
                .background(Color(UIColor.systemGroupedBackground))
                .overlay {
                    if presenter.universities.isEmpty && !presenter.appliedSearchText.isEmpty && !presenter.searchText.isEmpty && !presenter.isLoading {
                        EmptyStateView(text: presenter.appliedSearchText)
                    }
                }
                .searchable(text: $presenter.searchText, prompt: "Search by name...")
            }
        }
        .navigationTitle(presenter.selectedCountry.displayName)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Picker("Country", selection: $presenter.selectedCountry) {
                        ForEach(Country.allCases) { country in
                            Text("\(country.flag) \(country.code)").tag(country)
                        }
                    }
                } label: {
                    HStack(spacing: 4) {
                        Text(presenter.selectedCountry.flag)
                        Text(presenter.selectedCountry.code)
                            .font(.headline)
                    }
                    .padding(8)
                    .cornerRadius(8)
                }
            }
        }
        .onChange(of: presenter.selectedCountry) { _ in
            presenter.countryDidChange()
        }
        .onAppear {
            presenter.viewDidLoad()
        }
    }
}
