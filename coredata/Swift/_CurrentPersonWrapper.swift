import Foundation

class _CurrentPersonWrapper: NSObject {
    let _entity: CurrentPerson?
    func entity() -> CurrentPerson? {
        return _entity
    }

    init(currentPerson: CurrentPerson?) {
        _entity = currentPerson
        super.init()
        if let e = currentPerson {
        }
    }
    func updateCurrentPerson(currentPerson: CurrentPerson) {
    }
}
