//
//  ClassesPresenter.swift
//  Core
//
//  Created by Pedro Contreras on 20/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation
import Combine

/// Handles all the logic for manipulating a list of classes.
class ClassesPresenter {
    
    /// The current state of the presenter mapped into a struct.
    @Published private(set) var viewState = ClassesViewState()
    
    /// The text that is currently being searched for.
    var filterText = CurrentValueSubject<String, Never>("")
    
    /// The latest `ClassSet` that was fetched from the network, useful for filtering.
    private var latestClassFetch = CurrentValueSubject<ClassSet, Never>(ClassSet(classes: []))
    
    /// The web service from which the classes should be loaded.
    private var service: AnyPublisher<ClassSet, Error>
    
    /// Set of `AnyCancellable`s to avoid deallocating the subscriptions.
    private var subscriptions: Set<AnyCancellable> = []
    
    /// Initialize a `ClassesPresenter`.
    /// - Parameter service: The web service from which `ClassSet` should be loaded.
    init(service: AnyPublisher<ClassSet, Error>) {
        self.service = service
        initializeFilterPublisher()
    }
    
    /// Initializes the subscription to filter the available classes when `filterText` is set.
    func initializeFilterPublisher() {
        latestClassFetch.combineLatest(filterText)
            .handleEvents(receiveOutput: { [weak self] in self?.viewState.isLoading = !$1.isEmpty })
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.global())
            .map { $0.filteringClassesWithTitle($1) }
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in  self?.updateViewState(model: $0)})
            .store(in: &subscriptions)
    }
    
    /// Fetch all the available classes from the API.
    func fetchAllClasses() {
        viewState.isLoading = true
        service
            .handleEvents(receiveOutput: { [weak self] in self?.latestClassFetch.value = $0 })
            .replaceError(with: ClassSet(classes: [.error]))
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in  self?.updateViewState(model: $0)})
            .store(in: &subscriptions)
    }
        
    /// Updates `viewState` from a `ClassSet`
    /// - Parameter model: The class set from which `viewState` should construct its internal state from.
    private func updateViewState(model: ClassSet) {
        self.viewState.classes = model.classes
        self.viewState.isLoading = false
    }
    
    deinit {
        print("Deinit called")
    }
}
