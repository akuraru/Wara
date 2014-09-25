import Foundation

class _BloodPressureWrapper : HealthDataWrapper {
    func entity() -> BloodPressure? {
        return _entity as BloodPressure?
    }
    var bloodPressure :NSNumber?
    
    init(entity :BloodPressure?) {
        super.init(entity: entity)
        if let e = entity {
            bloodPressure = e.bloodPressure
        }
    }
    override func updateEntity(entity :HealthData) {
        
    }
    func updateEntity(entity :BloodPressure) {
        super.updateEntity(entity)
        entity.bloodPressure = bloodPressure
    }
}
