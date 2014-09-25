#import <Foundation/Foundation.h>

@class Person;


@interface _PersonWrapper : NSObject
@property(nonatomic, strong) NSDate *birthday;
@property(nonatomic, strong) NSString *name;

@property(readonly, strong, nonatomic) Person *entity;

- (instancetype)initWithEntity:(Person *)entity;

- (void)updateEntity:(Person *)entity;
@end
