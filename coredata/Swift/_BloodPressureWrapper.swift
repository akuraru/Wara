import Foundation

class _BloodPressureWrapper: HealthDataWrapper {
    override func entity() -> BloodPressure? {
        return _entity as BloodPressure?
    }
    var bloodPressure: NSNumber?

    init(bloodPressure: BloodPressure?) {
        super.init(healthData: bloodPressure)
        if let e = bloodPressure {
            self.bloodPressure = e.bloodPressure
        }
    }
    func updateBloodPressure(bloodPressure: BloodPressure) {
        super.updateHealthData(bloodPressure)
        bloodPressure.bloodPressure = self.bloodPressure
    }
}
