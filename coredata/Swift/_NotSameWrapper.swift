import Foundation

class _NotSameWrapper: NSObject {
    let _entity: NotSame?
    func entity() -> NotSame? {
        return _entity
    }
    var boolean: NSNumber?
    var data: NSData?
    var date: NSDate?
    var decimal: NSDecimalNumber?
    var dou: NSNumber?
    var flo: NSNumber?
    var int16: NSNumber?
    var int32: NSNumber?
    var int64: NSNumber?
    var string: String?
    var transformable: AnyObject?

    init(notSame: NotSame?) {
        _entity = notSame
        super.init()
        if let e = notSame {
            self.boolean = e.boolean
            self.data = e.data
            self.date = e.date
            self.decimal = e.decimal
            self.dou = e.dou
            self.flo = e.flo
            self.int16 = e.int16
            self.int32 = e.int32
            self.int64 = e.int64
            self.string = e.string
            self.transformable = e.transformable
        }
    }
    func updateNotSame(notSame: NotSame) {
        notSame.boolean = self.boolean
        notSame.data = self.data
        notSame.date = self.date
        notSame.decimal = self.decimal
        notSame.dou = self.dou
        notSame.flo = self.flo
        notSame.int16 = self.int16
        notSame.int32 = self.int32
        notSame.int64 = self.int64
        notSame.string = self.string
        notSame.transformable = self.transformable
    }
}
