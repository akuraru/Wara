#import <Foundation/Foundation.h>

@class HealthData;


@interface _HealthDataWrapper : NSObject
@property(nonatomic, strong) NSNumber *height;
@property(nonatomic, strong) NSDate *timeStamp;
@property(nonatomic, strong) NSNumber *weight;

@property(readonly, strong, nonatomic) HealthData *entity;

- (instancetype)initWithEntity:(HealthData *)entity;

- (void)updateEntity:(HealthData *)entity;
@end
