#import "_CurrentPersonWrapper.h"
#import "CurrentPerson.h"

@interface _CurrentPersonWrapper ()
@end

@implementation _CurrentPersonWrapper {
}
- (instancetype)initWithEntity:(CurrentPerson *)entity {
    self = [super init];
    if (self) {
        _entity = entity;
    }
    return self;
}

- (void)updateEntity:(CurrentPerson *)entity {
}
@end
