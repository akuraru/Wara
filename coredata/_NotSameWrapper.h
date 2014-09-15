#import <Foundation/Foundation.h>

@class NotSame;


@interface _NotSameWrapper : NSObject
@property(nonatomic, strong) NSNumber *boolean;
@property(nonatomic, strong) NSData *data;
@property(nonatomic, strong) NSDate *date;
@property(nonatomic, strong) NSDecimalNumber *decimal;
@property(nonatomic, strong) NSNumber *double;
@property(nonatomic, strong) NSNumber *float;
@property(nonatomic, strong) NSNumber *int16;
@property(nonatomic, strong) NSNumber *int32;
@property(nonatomic, strong) NSNumber *int64;
@property(nonatomic, strong) NSString *string;
@property(nonatomic, strong) id transformable;

@property(readonly, strong, nonatomic) NotSame *entity;

- (instancetype)initWithEntity:(NotSame *)entity;

- (void)updateEntity:(NotSame *)entity;
@end
