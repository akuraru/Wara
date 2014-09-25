import Foundation

class _HealthDataWrapper : NSObject {
    let _entity :HealthData?
    var height :NSNumber?
    var timeStamp :NSDate?
    var weight :NSNumber?
    
    init(entity :HealthData?) {
        _entity = entity
        super.init()
        if let e = _entity {
            height = e.height
            timeStamp = e.timeStamp
            weight = e.weight
        }
    }
    func updateEntity(entity :HealthData) {
        entity.height = height
        entity.timeStamp = timeStamp
        entity.weight = weight
    }
}