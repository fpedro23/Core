//
//  ClassesPresenter.swift
//  Core
//
//  Created by Pedro Contreras on 20/10/20.
//  Copyright © 2020 Pedro Contreras. All rights reserved.
//

import Foundation
import Combine

class ClassesPresenter {
    
    @Published
    private(set) var viewState = ClassesViewState()
        
    var filterText = CurrentValueSubject<String, Never>("")
    
    private var latestClassFetch = CurrentValueSubject<ClassSet, Never>(ClassSet(classes: []))
    
    private var service: AnyPublisher<ClassSet, Error>
    
    private var subscriptions: Set<AnyCancellable> = []

    init(service: AnyPublisher<ClassSet, Error>) {
        self.service = service
        initializeFilterPublisher()
    }
    
    func initializeFilterPublisher() {
        latestClassFetch.combineLatest(filterText)
            .handleEvents(receiveOutput: { [weak self] in self?.viewState.isLoading = !$1.isEmpty })
            .debounce(for: .milliseconds(500), scheduler: DispatchQueue.global())
            .map { $0.filteringClassesWithTitle($1) }
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in  self?.updateViewState(model: $0)})
            .store(in: &subscriptions)
    }
    
    func fetchAllClasses() {
        viewState.isLoading = true
        service
            .handleEvents(receiveOutput: { [weak self] in self?.latestClassFetch.value = $0 })
            .replaceError(with: ClassSet(classes: [.error]))
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] in  self?.updateViewState(model: $0)})
            .store(in: &subscriptions)
    }
    
    
    private func updateViewState(model: ClassSet) {
        self.viewState.classes = model.classes
        self.viewState.isLoading = false
    }
    
    deinit {
        print("Deiniteeded")
    }
}
