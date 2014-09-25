#import "_PersonWrapper.h"
#import "Person.h"

@interface _PersonWrapper ()
@end

@implementation _PersonWrapper {
}
- (instancetype)initWithEntity:(Person *)entity {
    self = [super init];
    if (self) {
        _entity = entity;
        self.birthday = entity.birthday;
        self.name = entity.name;
    }
    return self;
}

- (void)updateEntity:(Person *)entity {
    entity.birthday = self.birthday;
    entity.name = self.name;
}
@end
