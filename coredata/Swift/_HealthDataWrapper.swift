import Foundation

class _HealthDataWrapper: NSObject {
    let _entity: HealthData?
    func entity() -> HealthData? {
        return _entity
    }
    var height: NSNumber?
    var timeStamp: NSDate?
    var weight: NSNumber?

    init(healthData: HealthData?) {
        _entity = healthData
        super.init()
        if let e = healthData {
            self.height = e.height
            self.timeStamp = e.timeStamp
            self.weight = e.weight
        }
    }
    func updateHealthData(healthData: HealthData) {
        healthData.height = self.height
        healthData.timeStamp = self.timeStamp
        healthData.weight = self.weight
    }
}
