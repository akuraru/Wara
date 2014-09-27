import Foundation

class _PersonWrapper: NSObject {
    let _entity: Person?
    func entity() -> Person? {
        return _entity
    }
    var birthday: NSDate?
    var name: String?

    init(person: Person?) {
        _entity = person
        super.init()
        if let e = person {
            self.birthday = e.birthday
            self.name = e.name
        }
    }
    func updatePerson(person: Person) {
        person.birthday = self.birthday
        person.name = self.name
    }
}
