#import "HealthDataWrapper.h"

@class BloodPressure;


@interface _BloodPressureWrapper : HealthDataWrapper
@property(nonatomic, strong) NSNumber *bloodPressure;

- (BloodPressure *)entity;

- (instancetype)initWithEntity:(BloodPressure *)entity;

- (void)updateEntity:(BloodPressure *)entity;
@end
