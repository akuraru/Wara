#import <Foundation/Foundation.h>

@class CurrentPerson;


@interface _CurrentPersonWrapper : NSObject

@property(readonly, strong, nonatomic) CurrentPerson *entity;

- (instancetype)initWithEntity:(CurrentPerson *)entity;

- (void)updateEntity:(CurrentPerson *)entity;
@end
