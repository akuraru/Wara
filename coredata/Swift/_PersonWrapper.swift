import Foundation

class _PersonWrapper : NSObject {
    let entity: Person?
    var birthday : NSDate?
    var name : String?
    
    init(_entity : Person?) {
        entity = _entity
        super.init()
        if let e = _entity {
            birthday = e.birthday
            name = e.name
        }
    }
    func updateEntity(entity :Person) {
        entity.birthday = birthday
        entity.name = name
    }
}
