#import "_NotSameWrapper.h"
#import "NotSame.h"

@interface _NotSameWrapper ()
@end

@implementation _NotSameWrapper {
}
- (instancetype)initWithEntity:(NotSame *)entity {
    self = [super init];
    if (self) {
        _entity = entity;
        self.boolean = entity.boolean;
        self.data = entity.data;
        self.date = entity.date;
        self.decimal = entity.decimal;
        self.double = entity.double;
        self.float = entity.float;
        self.int16 = entity.int16;
        self.int32 = entity.int32;
        self.int64 = entity.int64;
        self.string = entity.string;
        self.transformable = entity.transformable;
    }
    return self;
}

- (void)updateEntity:(NotSame *)entity {
    entity.boolean = self.boolean;
    entity.data = self.data;
    entity.date = self.date;
    entity.decimal = self.decimal;
    entity.double = self.double;
    entity.float = self.float;
    entity.int16 = self.int16;
    entity.int32 = self.int32;
    entity.int64 = self.int64;
    entity.string = self.string;
    entity.transformable = self.transformable;
}
@end
