import SwiftUI

class NeugelbViewModel: NSObject, ObservableObject {

    // MARK: - Properties

    let cancellable = CancellableBag()

    deinit {
        #if Development
        print(Self.self, "was deinited")
        #endif
    }

}
