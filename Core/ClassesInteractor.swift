//
//  ClassesInteractor.swift
//  Core
//
//  Created by Pedro Contreras on 20/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation
import Combine

class ClassesInteractor {
    
    @Published
    private(set) var viewState = ClassesViewState()
        
    var filterText = CurrentValueSubject<String, Never>("")
    
    private var latestClassFetch = CurrentValueSubject<ClassSet, Never>(ClassSet(classes: []))
    
    private var publisher: AnyPublisher<ClassSet, Error>
    
    private var subscriptions: Set<AnyCancellable> = []

    init(publisher: AnyPublisher<ClassSet, Error>) {
        self.publisher = publisher
        initializeFilterPublisher()
    }
    
    func initializeFilterPublisher() {
        latestClassFetch.combineLatest(filterText)
            .handleEvents(receiveOutput: { self.viewState.isLoading = !$1.isEmpty })
            .debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .map { $0.filteringClassesWithTitle($1) }
            .sink(receiveValue: updateViewState)
            .store(in: &subscriptions)
    }
    
    func fetchAllClasses() {
        viewState.isLoading = true
        publisher
            .handleEvents(receiveOutput: { self.latestClassFetch.value = $0 })
            .replaceError(with: ClassSet(classes: [.error]))
            .sink(receiveValue: updateViewState)
            .store(in: &subscriptions)
    }
    
    
    private func updateViewState(model: ClassSet) {
        self.viewState.classes = model.classes
        self.viewState.isLoading = false
    }
}
