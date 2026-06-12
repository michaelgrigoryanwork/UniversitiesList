//
//  UniversitiesListPresenter.swift
//  Universities Browser App
//
//  Created by Michael Grigoryan on 11.06.26.
//

import Foundation
import Combine
import CoreDomainKit
import CoreDataKit

@MainActor
public final class UniversitiesListPresenter: ObservableObject {
    @Published public var universities: [University] = []
    @Published public var searchText: String = ""
    @Published public var appliedSearchText: String = ""
    @Published public var isLoading: Bool = false
    @Published public var isRowLoading: Bool = false
    @Published public var errorMessage: String?
    @Published public var isShowingError: Bool = false
    @Published public var selectedCountry: Country {
        didSet {
            userDefaultsStorage.save(selectedCountry, forKey: .selectedCountry)
        }
    }
    
    private var currentPage = 0
    private var hasMorePages = true
    private var cancellables = Set<AnyCancellable>()
    
    public var interactor: UniversitiesListInteractorInputProtocol?
    public var router: UniversitiesListRouterProtocol?

    private let userDefaultsStorage: UserDefaultsStorage

    public init(userDefaultsStorage: UserDefaultsStorage = .init()) {
        self.userDefaultsStorage = userDefaultsStorage
        self.selectedCountry = userDefaultsStorage.load(forKey: .selectedCountry) ?? .unitedArabEmirates
        
        setupSearchDebounce()
    }
}

@MainActor
extension UniversitiesListPresenter: UniversitiesListInteractorOutputProtocol {
    public func didFetchUniversities(_ newUniversities: [University], hasMore: Bool) {
        self.isLoading = false
        self.isRowLoading = false
        self.hasMorePages = hasMore
        
        if currentPage == 0 {
            self.universities = newUniversities
        } else {
            self.universities.append(contentsOf: newUniversities)
        }
        
        if hasMore {
            self.currentPage += 1
        }
    }
    
    public func didFail(with error: Error) {
        self.isLoading = false
        self.isRowLoading = false
        self.errorMessage = error.localizedDescription
        self.isShowingError = true
    }
}

public extension UniversitiesListPresenter {
    func viewDidLoad() {
        guard universities.isEmpty else { return }
        fetchData()
    }
    
    func countryDidChange() {
        self.universities = []
        self.appliedSearchText = ""
        
        if !self.searchText.isEmpty {
            self.searchText = ""
        } else {
            self.resetAndFetch()
        }
    }
    
    func fetchData() {
        guard !isLoading && !isRowLoading && hasMorePages else { return }
        
        if currentPage == 0 {
            isLoading = true
        } else {
            isRowLoading = true
        }
        
        isShowingError = false
        
        let cleanSearch = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        self.appliedSearchText = cleanSearch
        
        let query = cleanSearch.isEmpty ? nil : cleanSearch
        
        Task {
            await interactor?.fetchUniversities(for: selectedCountry, name: query, page: currentPage)
        }
    }
    
    func requestMoreDataIfNeeded(item: University) {
        let thresholdIndex = universities.index(universities.endIndex, offsetBy: -5)
        if universities.firstIndex(where: { $0.id == item.id }) == thresholdIndex {
            fetchData()
        }
    }
    
    func didSelect(university: University) {
        router?.navigateToDetails(for: university)
    }
}

private extension UniversitiesListPresenter {
    func setupSearchDebounce() {
        $searchText
            .dropFirst()
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] _ in
                self?.resetAndFetch()
            }
            .store(in: &cancellables)
    }

    func resetAndFetch() {
        currentPage = 0
        hasMorePages = true
        fetchData()
    }
}
