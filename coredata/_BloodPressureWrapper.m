#import "_BloodPressureWrapper.h"
#import "BloodPressure.h"

@interface _BloodPressureWrapper ()
@end

@implementation _BloodPressureWrapper {
}
- (BloodPressure *)entity {
    return (BloodPressure *) [super entity];
}

- (instancetype)initWithEntity:(BloodPressure *)entity {
    self = [super initWithEntity:entity];
    if (self) {
        self.bloodPressure = entity.bloodPressure;
    }
    return self;
}

- (void)updateEntity:(BloodPressure *)entity {
    [super updateEntity:entity];
    entity.bloodPressure = self.bloodPressure;
}
@end
