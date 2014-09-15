#import "_HealthDataWrapper.h"
#import "HealthData.h"

@interface _HealthDataWrapper ()
@end

@implementation _HealthDataWrapper {
}
- (instancetype)initWithEntity:(HealthData *)entity {
    self = [super init];
    if (self) {
        _entity = entity;
        self.height = entity.height;
        self.timeStamp = entity.timeStamp;
        self.weight = entity.weight;
    }
    return self;
}

- (void)updateEntity:(HealthData *)entity {
    entity.height = self.height;
    entity.timeStamp = self.timeStamp;
    entity.weight = self.weight;
}
@end
