import Combine
import Foundation

final class CancellableBag {

    // MARK: - Private Properties

    private var cancellable = Set<AnyCancellable>()

}

// MARK: - Public Methods

extension CancellableBag {

    func store(_ anyCancellable: AnyCancellable) {
        anyCancellable.store(in: &cancellable)
    }

    func cancel() {
        cancellable.forEach { $0.cancel() }
        cancellable.removeAll()
    }

}

// MARK: - AnyCancellable Extension

extension AnyCancellable {

    func store(in bag: CancellableBag) {
        bag.store(self)
    }

}

// MARK: - Task Extension

extension Task {

    func eraseToAnyCancellable() -> AnyCancellable {
        .init(cancel)
    }

}
