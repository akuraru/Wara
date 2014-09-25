import Foundation

class _NotSameWrapper : NSObject {
    let entity :NotSame?
    var boolean :NSNumber?
    var data :NSData?
    var date :NSDate?
    var decimal :NSDecimalNumber?
    var dou :NSNumber?
    var flo :NSNumber?
    var int16 :NSNumber?
    var int32 :NSNumber?
    var int64 :NSNumber?
    var string :String?
    var transformable :AnyObject?
    
    init(_entity :NotSame?) {
        entity = _entity
        super.init()
        if let e = _entity {
            boolean = e.boolean
            data = e.data
            date = e.date
            decimal = e.decimal
            dou = e.dou
            flo = e.flo
            int16 = e.int16
            int32 = e.int32
            int64 = e.int64
            string = e.string
            transformable = e.transformable
        }
    }
    func updateEntity(entity :NotSame) {
        entity.boolean = boolean
        entity.data = data
        entity.date = date
        entity.decimal = decimal
        entity.dou = dou
        entity.flo = flo
        entity.int16 = int16
        entity.int32 = int32
        entity.int64 = int64
        entity.string = string
        entity.transformable = transformable
    }
}