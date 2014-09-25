import Foundation

class _CurrentPersonWrapper : NSObject {
    let entity :CurrentPerson?
    init(_entity :CurrentPerson?) {
        entity = _entity
        super.init()
        if let e = _entity {
        }
    }
    func updateEntity(entity :CurrentPerson) {
    }
}